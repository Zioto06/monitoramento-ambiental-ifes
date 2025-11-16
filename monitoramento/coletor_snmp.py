###############################################

# BIBLIOTECAS A SEREM INSTALADAS 

# pip install python-dotenv
# pip install mysql-connector-python
# pip install pysnmp

# O script coletor_snmp.py deve ser executado com o Python 3.11.

###############################################

import os
import time
import logging
from datetime import datetime
import sys
from pathlib import Path
from typing import Optional, Tuple

from pysnmp.hlapi import (
    SnmpEngine, CommunityData, UdpTransportTarget,
    ContextData, ObjectType, ObjectIdentity, getCmd
)

import mysql.connector
from mysql.connector import Error
from dotenv import load_dotenv

import smtplib
from email.mime_text import MIMEText

# ------------------------------------------------------------
# Carrega o arquivo dados.env
# ------------------------------------------------------------
ENV_PATH = Path(__file__).with_name("dados.env")
if not ENV_PATH.exists():
    # Sem o arquivo de configuração o coletor não funciona
    raise SystemExit("ERRO: arquivo 'dados.env' não encontrado na mesma pasta do coletor_snmp.py")

load_dotenv(dotenv_path=ENV_PATH, override=True)

# ======================== LEITURA DAS CONFIGS ========================

# ---------- SNMP / ESP32 ----------
# IP da ESP32 / agente SNMP na sua rede local
ESP_IP = os.getenv("ESP32_IP", "000.000.000.000")
SNMP_COMMUNITY = os.getenv("SNMP_COMMUNITY", "public")
SNMP_PORT = int(os.getenv("SNMP_PORT", "161"))

# OIDs expostos pelo firmware da ESP32 (inteiro ×10 para temperatura/umidade)
OID_T1 = os.getenv("OID_T1", ".1.3.6.1.4.1.99999.1.0")
OID_H1 = os.getenv("OID_H1", ".1.3.6.1.4.1.99999.1.1")
OID_T2 = os.getenv("OID_T2", ".1.3.6.1.4.1.99999.1.2")
OID_H2 = os.getenv("OID_H2", ".1.3.6.1.4.1.99999.1.3")

# ---------- MySQL ----------
# Ajuste conforme o seu servidor e base de dados
DB_HOST = os.getenv("MYSQL_HOST", "localhost")
DB_PORT = int(os.getenv("MYSQL_PORT", "3306")) # geralmente usada 3306
DB_DB   = os.getenv("MYSQL_DB", "BDLEITURA")   # altere se usar outro nome
DB_USER = os.getenv("MYSQL_USER", "root")      # altere conforme seu ambiente
DB_PASS = os.getenv("MYSQL_PASS", "")          # definido em @.env

# Período entre gravações no banco (em minutos)
PERIODO_COLETA_MINUTOS = int(os.getenv("PERIODO_COLETA_MINUTOS", "5"))
PERIODO_SEG = PERIODO_COLETA_MINUTOS * 60

# ---------- ALERTAS ----------
# Limites usados para disparar alertas
ALERTA_LIMITE_C = float(os.getenv("ALERTA_LIMITE_C", "30.0"))
ALERTA_LIMITE_UMID = float(os.getenv("ALERTA_LIMITE_UMID", "75.0"))

# Tempo mínimo (segundos) acima do limite para considerar alerta
MINIMO_SEG_ACIMA = int(os.getenv("MINIMO_SEG_ACIMA", "60"))

# Intervalo de reenvio de e-mail (minutos)
REENVIO_EMAIL_MINUTOS = int(os.getenv("REENVIO_EMAIL_MINUTOS", "5"))
REENVIO_EMAIL_SEG = REENVIO_EMAIL_MINUTOS * 60

# Intervalo entre leituras SNMP para verificação de alerta (segundos)
ALERT_CHECK_SEG = int(os.getenv("ALERT_CHECK_SEG", "30"))

# ---------- E-mail ----------
# Configurações de SMTP para envio de alertas
SMTP_HOST = os.getenv("SMTP_HOST", "smtp.seu_provedor.com")
SMTP_PORT = int(os.getenv("SMTP_PORT", "465")) # ou 587
SMTP_USER = os.getenv("SMTP_USER", "")
SMTP_PASS = os.getenv("SMTP_PASS", "")
SMTP_TO   = os.getenv("SMTP_TO", "")

# ---------- Log ----------
# Nível padrão de log (INFO, WARNING, ERROR...)
LOG_LEVEL = os.getenv("LOG_LEVEL", "ERROR")

logging.basicConfig(
    level=getattr(logging, LOG_LEVEL.upper(), logging.ERROR),
    format="%(asctime)s [%(levelname)s] %(message)s"
)

# Estados globais
ABOVE_LIMIT_SINCE: Optional[float] = None
LAST_EMAIL_TS: Optional[float] = None

# Última leitura SNMP válida (x10) e seu timestamp
LAST_VALID_SNMP: Optional[Tuple[int, int, int, int]] = None  # (t1x, h1x, t2x, h2x)
LAST_VALID_TS: Optional[float] = None


# ======================== FUNÇÕES ========================

# -------------------- SNMP helpers --------------------
def snmp_get(oid: str) -> Optional[int]:
    """Retorna o valor do OID ou None se falhar."""
    errorIndication, errorStatus, errorIndex, varBinds = next(
        getCmd(
            SnmpEngine(),
            CommunityData(SNMP_COMMUNITY, mpModel=0),
            UdpTransportTarget((ESP_IP, SNMP_PORT), timeout=3, retries=2),
            ContextData(),
            ObjectType(ObjectIdentity(oid))
        )
    )

    if errorIndication:
        logging.warning(f"SNMP erro: {errorIndication}")
        return None

    if errorStatus:
        logging.warning(
            f"SNMP erro: {errorStatus.prettyPrint()} at "
            f"{errorIndex and varBinds[int(errorIndex)-1][0] or '?'}"
        )
        return None

    for name, val in varBinds:
        try:
            return int(val)
        except Exception as e:
            logging.warning(f"SNMP valor inesperado em {name}: {val} ({e})")
            return None

    return None


def ler_leituras_snmp(max_tentativas: int = 3) -> Tuple[Optional[int], Optional[int], Optional[int], Optional[int]]:
    """
    Tenta ler T1,H1,T2,H2 até max_tentativas vezes.
    Se conseguir os 4 valores, retorna.
    Se não, retorna o que tiver (podem haver Nones).
    """
    t1x = h1x = t2x = h2x = None

    for tentativa in range(1, max_tentativas + 1):
        t1x = snmp_get(OID_T1)
        h1x = snmp_get(OID_H1)
        t2x = snmp_get(OID_T2)
        h2x = snmp_get(OID_H2)

        if None not in (t1x, h1x, t2x, h2x):
            if tentativa > 1:
                logging.info(f"SNMP OK na tentativa {tentativa}.")
            return t1x, h1x, t2x, h2x

        logging.warning(f"Leitura SNMP incompleta (tentativa {tentativa}/{max_tentativas}).")
        time.sleep(1)

    return t1x, h1x, t2x, h2x


# -------------------- DB helpers --------------------
def connect_db():
    """Abre conexão com o banco MySQL."""
    return mysql.connector.connect(
        host=DB_HOST,
        port=DB_PORT,
        database=DB_DB,
        user=DB_USER,
        password=DB_PASS,
        autocommit=True
    )


def ensure_table(conn) -> None:
    """Cria a tabela LEITURA se ainda não existir."""
    ddl = """
    CREATE TABLE IF NOT EXISTS LEITURA (
      LEIT_ID_LEITURA    INT AUTO_INCREMENT PRIMARY KEY,
      LEIT_DT_DATAHORA   DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
      LEIT_TX_SENSOR     VARCHAR(10) NOT NULL,
      LEIT_INT_VALORTEMP INT NOT NULL,
      LEIT_INT_VALORUMID INT NOT NULL,
      INDEX IX_DATA (LEIT_DT_DATAHORA),
      INDEX IX_SENSOR_DATA (LEIT_TX_SENSOR, LEIT_DT_DATAHORA)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
    """
    with conn.cursor() as cur:
        cur.execute(ddl)


def inserir_lote(conn, linhas):
    """Insere um conjunto de linhas na tabela LEITURA."""
    sql = """
    INSERT INTO LEITURA (
        LEIT_DT_DATAHORA,
        LEIT_TX_SENSOR,
        LEIT_INT_VALORTEMP,
        LEIT_INT_VALORUMID
    ) VALUES (%s, %s, %s, %s)
    """
    with conn.cursor() as cur:
        cur.executemany(sql, linhas)


def salvar_no_bd(t1x: int, h1x: int, t2x: int, h2x: int) -> None:
    """
    Grava a leitura (x10) no BD usando o horário atual.
    Cria dois registros: um para cada sensor (DHT11 / DHT22).
    """
    agora = datetime.now()
    linhas = [
        (agora, "DHT11", int(t1x), int(h1x)),
        (agora, "DHT22", int(t2x), int(h2x)),
    ]

    try:
        conn = connect_db()
        ensure_table(conn)
        inserir_lote(conn, linhas)
        conn.close()
        logging.info("Leitura salva no banco de dados.")
    except Error as e:
        logging.error(f"Erro MySQL: {e}")


# -------------------- E-mail helper --------------------
def send_alert_email(t1, u1, t2, u2):
    """
    Envia um e-mail de alerta usando as configurações SMTP do dados.env.
    """
    if not (SMTP_USER and SMTP_PASS and SMTP_TO):
        logging.error("Configuração SMTP incompleta — não é possível enviar e-mail.")
        return

    subject = "ALERTA — Condições ambientais acima dos limites configurados"

    body = f"""
Alerta de condição elevada detectada.

Horário: {datetime.now().strftime("%d/%m/%Y %H:%M:%S")}

Limites configurados:
• Temperatura: {ALERTA_LIMITE_C:.1f} °C
• Umidade: {ALERTA_LIMITE_UMID:.1f} %

Leituras atuais:
• DHT11: {t1:.1f} °C | {u1:.1f} %
• DHT22: {t2:.1f} °C | {u2:.1f} %

O sistema reenviará alerta a cada {REENVIO_EMAIL_MINUTOS} minuto(s)
enquanto os valores permanecerem acima dos limites.
"""

    msg = MIMEText(body, "plain", "utf-8")
    msg["Subject"] = subject
    msg["From"] = SMTP_USER
    msg["To"] = SMTP_TO

    try:
        with smtplib.SMTP_SSL(SMTP_HOST, SMTP_PORT) as server:
            server.login(SMTP_USER, SMTP_PASS)
            server.send_message(msg)
        logging.info("E-mail de alerta enviado.")
    except Exception as e:
        logging.error(f"Erro enviando e-mail: {e}")


# -------------------- Lógica de alerta --------------------
def processar_alerta(t1x: int, h1x: int, t2x: int, h2x: int) -> None:
    """
    Verifica se temperatura/umidade estão acima dos limites.
    - Se T e/ou Umid em ambos sensores > limites por MINIMO_SEG_ACIMA → envia e-mail.
    - Reenvia a cada REENVIO_EMAIL_SEG enquanto mantiver condição.
    """
    global ABOVE_LIMIT_SINCE, LAST_EMAIL_TS

    t1, u1 = t1x / 10.0, h1x / 10.0
    t2, u2 = t2x / 10.0, h2x / 10.0
    agora = time.time()

    cond_temp = t1 > ALERTA_LIMITE_C and t2 > ALERTA_LIMITE_C
    cond_umid = u1 > ALERTA_LIMITE_UMID and u2 > ALERTA_LIMITE_UMID

    if cond_temp or cond_umid:
        if ABOVE_LIMIT_SINCE is None:
            ABOVE_LIMIT_SINCE = agora
            logging.info("Limites ultrapassados. Iniciando contagem para alerta.")

        if (agora - ABOVE_LIMIT_SINCE) >= MINIMO_SEG_ACIMA:
            if LAST_EMAIL_TS is None or (agora - LAST_EMAIL_TS) >= REENVIO_EMAIL_SEG:
                send_alert_email(t1, u1, t2, u2)
                LAST_EMAIL_TS = agora
    else:
        if ABOVE_LIMIT_SINCE is not None:
            logging.info("Condição voltou abaixo dos limites. Resetando contagem.")
        ABOVE_LIMIT_SINCE = None


# -------------------- LOOP PRINCIPAL --------------------
def main():
    global LAST_VALID_SNMP, LAST_VALID_TS

    logging.info(
        f"Iniciando coleta SNMP em {ESP_IP}  "
        f"(gravação no BD a cada {PERIODO_COLETA_MINUTOS} min, "
        f"verificação de alerta a cada {ALERT_CHECK_SEG}s, "
        f"limite Temp = {ALERTA_LIMITE_C}°C, limite Umid = {ALERTA_LIMITE_UMID}%)…"
    )

    last_db_ts = 0.0

    while True:
        agora = time.time()

        # 1) Leitura SNMP a cada ALERT_CHECK_SEG (loop inteiro)
        t1x, h1x, t2x, h2x = ler_leituras_snmp()

        if None not in (t1x, h1x, t2x, h2x):
            # Atualiza última leitura válida (sobrescreve sempre que tudo vier ok)
            LAST_VALID_SNMP = (t1x, h1x, t2x, h2x)
            LAST_VALID_TS = agora

            # Usa a mesma leitura para alerta
            processar_alerta(t1x, h1x, t2x, h2x)
        else:
            logging.warning("SNMP incompleto nesta leitura — ignorando para alerta e BD.")

        # 2) Quando chegar o tempo de gravar no BD, usa a última leitura válida
        if LAST_VALID_SNMP is not None and (agora - last_db_ts) >= PERIODO_SEG:
            t1x_bd, h1x_bd, t2x_bd, h2x_bd = LAST_VALID_SNMP
            salvar_no_bd(t1x_bd, h1x_bd, t2x_bd, h2x_bd)
            last_db_ts = agora

        time.sleep(ALERT_CHECK_SEG)


if __name__ == "__main__":
    main()
