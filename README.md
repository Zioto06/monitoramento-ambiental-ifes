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
   Responsável pela aquisição das variáveis ambientais por meio dos sensores DHT11 e DHT22, conectados à ESP32 via protocolo One-Wire.

2. **Camada de Coleta, Processamento e Software Embarcado (ESP32 + Serviço Python)**  
   A ESP32 executa o software embarcado responsável por:
   - realizar leituras periódicas de temperatura e umidade,  
   - atualizar o display OLED,  
   - disponibilizar as variáveis na rede por meio do protocolo **SNMP**, atuando como um *Agente SNMP*,  
   - gerenciar tarefas internas via FreeRTOS (leitura dos sensores, controle de Wi-Fi, atualização do display).  

   Paralelamente, o **Serviço de Coleta em Python**, executado no servidor, atua como *Gerenciador SNMP*, consultando os valores expostos pela ESP32, armazenando-os no banco de dados e operando o módulo de alertas.

3. **Camada de Aplicação Web e Interação com Usuários**  
   Responsável pela visualização das leituras em tempo real, consulta ao banco de dados, geração de gráficos históricos e exibição do log de eventos acima do limiar.

---

A seguir, são apresentadas as figuras correspondentes a cada parte da arquitetura.

---

### **1. Camada de Hardware**
![Estrutura Geral de Hardware](Imagens/Estrutura%20Geral%20Hardware.png)

---

### **2. Camada de Coleta, Processamento e Software Embarcado**
![Fluxo Geral](Imagens/Fluxo%20geral%20de%20comunicação%20entre%20os%20módulos%20do%20sistema.png)

---

### **3. Camada de Aplicação Web**
![Interação com a Aplicação Web](Imagens/Interação%20da%20aplicação%20web%20com%20os%20módulos%20do%20sistema.png)
