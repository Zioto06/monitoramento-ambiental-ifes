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

## Arquitetura do Sistema

A arquitetura do sistema segue estruturada em três camadas principais que funcionam de forma integrada para permitir o monitoramento ambiental em tempo real. Cada camada cumpre uma função específica dentro do fluxo geral do sistema, desde o sensoriamento físico até a visualização dos dados pelo usuário final.

---

### **1. Camada de Hardware (Sensoriamento)**

Essa camada é responsável pela aquisição das variáveis ambientais. Ela é composta pelos sensores digitais **DHT11** e **DHT22**, conectados a um **ESP32**, além de um **display OLED (via I2C)** utilizado para exibição local e um **botão físico** para ativar/desativar o display.

A imagem a seguir apresenta a organização do módulo de hardware:

![Estrutura Geral do Hardware](Imagens/Estrutura%20Geral%20Hardware.png)

---

### **2. Software Embarcado na ESP**

O ESP32 executa um sistema embarcado desenvolvido especificamente para este projeto, sendo responsável por:

- realizar leituras periódicas dos sensores;
- organizar o funcionamento interno em tarefas separadas (FreeRTOS);
- manter a conexão Wi-Fi ativa com tentativa de reconexão;
- disponibilizar as variáveis ambientais na rede por meio do **protocolo SNMP**, operando como **Agente SNMP**.

---

### **3. Camada de Serviço de Coleta e Banco de Dados**

No servidor roda um serviço desenvolvido em Python, responsável por:

- consultar periodicamente a ESP32 via SNMP;
- registrar cada leitura em um **banco de dados MySQL**;
- verificar condições de alerta (ex.: temperatura acima do limite configurado);
- enviar notificações por e-mail via **SMTP** sempre que necessário.

Essa organização permite manter um histórico completo das variáveis coletadas e automatizar o processo de notificação.

A figura seguinte apresenta o fluxo lógico entre os módulos:

![Fluxo geral de comunicação entre os módulos do sistema](Imagens/Fluxo%20geral%20de%20comunicação%20entre%20os%20módulos%20do%20sistema.png)

---

### **4. Camada de Aplicação Web e Interação com Usuários**

A aplicação web funciona como o módulo de apresentação, permitindo ao usuário:

- visualizar as medições em **tempo real** diretamente da ESP32;
- acessar gráficos com **todas as leituras armazenadas** no banco de dados;
- consultar registros específicos de valores acima do limite definido.

A aplicação organiza e exibe as informações de modo simples, atualizável e acessível via navegador.

A figura abaixo resume a interação entre a aplicação e os demais componentes:

![Interação da aplicação web com os módulos do sistema](Imagens/Interação%20da%20aplicação%20web%20com%20os%20módulos%20do%20sistema.png)

---

### **Resumo da Arquitetura**

- O **hardware** coleta temperatura e umidade.
- A **ESP32** processa as leituras e expõe os valores via SNMP.
- O **servidor** coleta, armazena e dispara alertas.
- A **aplicação web** apresenta os dados ao usuário final.

Toda a solução foi projetada de forma modular, permitindo fácil manutenção, substituição de componentes e expansão futura para novos sensores ou novas funcionalidades.

