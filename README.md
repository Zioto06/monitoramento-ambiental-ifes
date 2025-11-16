# monitoramento-ambiental-ifes

Sistema de monitoramento ambiental desenvolvido para salas de servidores, utilizando ESP32 como agente SNMP, serviço de coleta em Python, armazenamento em banco de dados e visualização via aplicação web. Projeto desenvolvido no IFES – Campus Guarapari.

---

## 🖥️ Visão Geral

Este projeto realiza o monitoramento contínuo de temperatura e umidade utilizando sensores DHT acoplados a um ESP32, que atua como **Agente SNMP**. Um serviço em Python consulta periodicamente o dispositivo, grava os registros em um banco MySQL e disponibiliza uma **aplicação web** para visualização em tempo real, análise histórica e log de eventos acima dos limiares configurados.

Funcionalidades principais:

- Monitoramento contínuo (ESP32 + DHT)
- Consulta remota em tempo real (SNMP GET)
- Registro histórico em banco de dados
- Alertas via e-mail (SMTP)
- Gráficos de série histórica
- Log de eventos críticos
- Interface web desenvolvida com Flask + Chart.js

---

## 📡 Arquitetura do Sistema

```mermaid
flowchart TD
    A[Sensores] --> B[ESP32 - Agente SNMP]
    B --> C[Serviço de Coleta (Python)]
    C --> D[MySQL]
    D --> E[Aplicação Web]


