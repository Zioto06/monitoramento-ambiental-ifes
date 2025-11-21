###############################################################
# BIBLIOTECAS A SEREM INSTALADAS 
#
# pip install flask
# pip install python-dotenv
# pip install mysql-connector-python
# pip install pysnmp
###############################################################

import os
from pathlib import Path
from datetime import datetime
from flask import Flask, render_template, jsonify
import mysql.connector
from mysql.connector import Error
from dotenv import load_dotenv

# SNMP
from pysnmp.hlapi import (
    SnmpEngine, CommunityData, UdpTransportTarget,
    ContextData, ObjectType, ObjectIdentity, getCmd
)

# ============================================================
# Carrega arquivo de variáveis de ambiente:  @.env
# ============================================================
ENV_PATH = Path(__file__).with_name("@.env")
if not ENV_PATH.exists():
    print(">>> ERRO: arquivo '@.env' não encontrado em:", ENV_PATH)
    raise SystemExit(1)

load_dotenv(dotenv_path=ENV_PATH, override=True)
print(">>> @.env lido de:", ENV_PATH)
print(">>> MYSQL_USER:", os.getenv("MYSQL_USER"))
print(">>> MYSQL_PASS definido?", bool(os.getenv("MYSQL_PASS")))

# ============================================================
# Config do MySQL e Flask
# ============================================================
DB_CFG = dict(
    host=os.getenv("MYSQL_HOST", "localhost"),
    port=int(os.getenv("MYSQL_PORT", "3306")),
    database=os.getenv("MYSQL_DB", "BDLEITURA"),
    user=os.getenv("MYSQL_USER", "root"),
    password=os.getenv("MYSQL_PASS", "")
)

PORT = int(os.getenv("PORT", "8000"))

# Limites de alerta
ALERTA_LIMITE_C = float(os.getenv("ALERTA_LIMITE_C", "23.0"))
ALERTA_LIMITE_UMID = float(os.getenv("ALERTA_LIMITE_UMID", "70.0"))

app = Flask(__name__)

def get_conn():
    return mysql.connector.connect(**DB_CFG)

# ============================================================
# Config SNMP
# ============================================================
SNMP_HOST = os.getenv("ESP32_IP", "192.168.0.100")
SNMP_COMMUNITY = os.getenv("SNMP_COMMUNITY", "public")
SNMP_PORT = int(os.getenv("SNMP_PORT", "161"))

OID_T2 = os.getenv("OID_T2", ".1.3.6.1.4.1.99999.1.2")
OID_H2 = os.getenv("OID_H2", ".1.3.6.1.4.1.99999.1.3")

def snmp_get_int(oid: str):
    target = UdpTransportTarget((SNMP_HOST, SNMP_PORT))
    target.timeout = 2
    target.retries = 1

    errorIndication, errorStatus, errorIndex, varBinds = next(
        getCmd(
            SnmpEngine(),
            CommunityData(SNMP_COMMUNITY, mpModel=0),
            target,
            ContextData(),
            ObjectType(ObjectIdentity(oid))
        )
    )

    if errorIndication:
        print(f">>> SNMP erroIndication em {oid}: {errorIndication}")
        return None

    if errorStatus:
        print(
            ">>> SNMP errorStatus:",
            errorStatus.prettyPrint(),
            "at",
            errorIndex and varBinds[int(errorIndex) - 1][0] or "?"
        )
        return None

    for name, val in varBinds:
        try:
            return int(val)
        except Exception as e:
            print(f">>> SNMP valor inesperado em {name}: {val} ({e})")
            return None

    return None

# ============================================================
# Rotas HTML
# ============================================================
@app.route("/instantaneo")
def instantaneo():
    return render_template("instantaneo.html")

@app.route("/")
@app.route("/graficos")
def index():
    return render_template("index.html")

@app.route("/acima23")
def acima23():
    return render_template(
        "acima23.html",
        limite_temp=ALERTA_LIMITE_C,
        limite_umid=ALERTA_LIMITE_UMID
    )

# ============================================================
# API – Leituras gerais
# ============================================================
@app.route("/api/leituras")
def api_leituras():
    N = 500
    sql = """
    SELECT LEIT_DT_DATAHORA, LEIT_TX_SENSOR,
           LEIT_INT_VALORTEMP, LEIT_INT_VALORUMID
      FROM LEITURA
     ORDER BY LEIT_DT_DATAHORA DESC
     LIMIT %s
    """

    try:
        rows = []
        with get_conn() as conn:
            with conn.cursor() as cur:
                cur.execute(sql, (N,))
                for (dt, sensor, t_x10, h_x10) in cur:
                    rows.append(dict(
                        momento=dt.strftime("%Y-%m-%d %H:%M:%S"),
                        sensor=sensor,
                        temp=(float(t_x10) / 10.0) if t_x10 is not None else None,
                        umid=(float(h_x10) / 10.0) if h_x10 is not None else None,
                    ))

        rows.reverse()
        return jsonify(rows)

    except Error as e:
        print(">>> Erro MySQL:", e)
        return jsonify({"error": "MySQL error", "message": str(e)}), 500

# ============================================================
# API – Temperaturas acima do limite
# ============================================================
@app.route("/api/leituras_acima23")
def api_leituras_acima23():
    N = 500
    limite_x10 = int(ALERTA_LIMITE_C * 10)

    sql = """
    SELECT LEIT_DT_DATAHORA, LEIT_TX_SENSOR,
           LEIT_INT_VALORTEMP, LEIT_INT_VALORUMID
      FROM LEITURA
     WHERE LEIT_INT_VALORTEMP > %s
     ORDER BY LEIT_DT_DATAHORA DESC
     LIMIT %s
    """

    try:
        registros = []
        with get_conn() as conn:
            with conn.cursor() as cur:
                cur.execute(sql, (limite_x10, N))
                registros = cur.fetchall()

        grupos = {}
        for dt, sensor, t_x10, h_x10 in registros:
            momento = dt.strftime("%Y-%m-%d %H:%M:%S")
            if momento not in grupos:
                grupos[momento] = {}
            grupos[momento][sensor] = {
                "temp_x10": t_x10,
                "umid_x10": h_x10
            }

        rows = []
        for momento, sensores in grupos.items():
            if "DHT11" in sensores and "DHT22" in sensores:
                t11 = sensores["DHT11"]["temp_x10"]
                t22 = sensores["DHT22"]["temp_x10"]

                if t11 > limite_x10 and t22 > limite_x10:
                    for sensor_nome, vals in sensores.items():
                        rows.append(dict(
                            momento=momento,
                            sensor=sensor_nome,
                            temp=(vals["temp_x10"] / 10.0),
                            umid=(vals["umid_x10"] / 10.0)
                        ))

        rows.sort(key=lambda r: r["momento"])
        return jsonify(rows)

    except Error as e:
        print(">>> Erro MySQL (acima_temp):", e)
        return jsonify({"error": "MySQL error", "message": str(e)}), 500

# ============================================================
# API – Umidades acima do limite
# ============================================================
@app.route("/api/leituras_acima_umid")
def api_leituras_acima_umid():
    N = 500
    limite_umid_x10 = int(ALERTA_LIMITE_UMID * 10)

    sql = """
    SELECT LEIT_DT_DATAHORA, LEIT_TX_SENSOR,
           LEIT_INT_VALORTEMP, LEIT_INT_VALORUMID
      FROM LEITURA
     WHERE LEIT_INT_VALORUMID > %s
     ORDER BY LEIT_DT_DATAHORA DESC
     LIMIT %s
    """

    try:
        registros = []
        with get_conn() as conn:
            with conn.cursor() as cur:
                cur.execute(sql, (limite_umid_x10, N))
                registros = cur.fetchall()

        grupos = {}
        for dt, sensor, t_x10, h_x10 in registros:
            momento = dt.strftime("%Y-%m-%d %H:%M:%S")
            if momento not in grupos:
                grupos[momento] = {}
            grupos[momento][sensor] = {
                "temp_x10": t_x10,
                "umid_x10": h_x10
            }

        rows = []
        for momento, sensores in grupos.items():
            if "DHT11" in sensores and "DHT22" in sensores:
                h11 = sensores["DHT11"]["umid_x10"]
                h22 = sensores["DHT22"]["umid_x10"]
                if h11 > limite_umid_x10 and h22 > limite_umid_x10:
                    for sensor_nome, vals in sensores.items():
                        rows.append(dict(
                            momento=momento,
                            sensor=sensor_nome,
                            temp=(vals["temp_x10"] / 10.0),
                            umid=(vals["umid_x10"] / 10.0)
                        ))

        rows.sort(key=lambda r: r["momento"])
        return jsonify(rows)

    except Error as e:
        print(">>> Erro MySQL (acima_umid):", e)
        return jsonify({"error": "MySQL error", "message": str(e)}), 500

# ============================================================
# API – Leitura SNMP em tempo real
# ============================================================
@app.route("/api/dht22_snmp")
def api_dht22_snmp():
    t_raw = snmp_get_int(OID_T2)
    h_raw = snmp_get_int(OID_H2)

    temp = (t_raw / 10.0) if t_raw is not None else None
    umid = (h_raw / 10.0) if h_raw is not None else None
    agora = datetime.now().strftime("%Y-%m-%d %H:%M:%S")

    return jsonify({
        "temp": temp,
        "umid": umid,
        "momento": agora,
        "ok": (temp is not None and umid is not None)
    })

# ============================================================
# Bootstrap
# ============================================================
if __name__ == '__main__':
    print(f">>> Flask rodando em 0.0.0.0:{PORT}")
    app.run(host='0.0.0.0', port=PORT, debug=True)
