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
# 📐 Arquitetura do Sistema

A arquitetura do sistema é organizada em três camadas principais:  
1. **Camada de Hardware (Sensoriamento)**  
2. **Camada de Coleta e Processamento (ESP32 + Serviço Python)**  
3. **Camada de Aplicação Web e Interação com Usuários**

A seguir, são apresentadas as figuras correspondentes a cada parte da arquitetura.

---

## 🔹 1. Estrutura de Hardware

![Estrutura Geral do Hardware](Imagens/Estrutura%20Geral%20Hardware.png)

---

## 🔹 2. Fluxo de Comunicação do Sistema

![Fluxo geral de comunicação](Imagens/Fluxo%20geral%20de%20comunicação%20entre%20os%20módulos%20do%20sistema.png)

---

## 🔹 3. Interação da Aplicação Web com o Sistema

![Interação da aplicação web](Imagens/Interação%20da%20aplicação%20web%20com%20os%20módulos%20do%20sistema.png)

---



