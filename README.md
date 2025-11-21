# monitoramento-ambiental-ifes

Sistema de monitoramento ambiental desenvolvido para salas de servidores, utilizando ESP32 como agente SNMP, serviço de coleta em Python, armazenamento em banco de dados e visualização via aplicação web. 

Projeto desenvolvido no IFES – Campus Guarapari.

---

## Visão Geral

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

A arquitetura do sistema segue estruturada em partes que funcionam de forma integrada para permitir o monitoramento ambiental em tempo real. Cada camada possui uma função específica dentro do fluxo geral do sistema, desde o sensoriamento físico até a visualização dos dados pelo usuário final.

---

### **1. Estrutura de Hardware**

Essa camada é responsável pela aquisição das variáveis ambientais. Ela é composta pelos sensores digitais **DHT11** e **DHT22**, conectados a um **ESP32**, além de um **display OLED (via I2C)** utilizado para exibição local e um **botão físico** para ativar/desativar o display.

A imagem a seguir apresenta a organização do módulo de hardware:

![Estrutura geral do Hardware](Imagens/Estrutura%20geral%20do%20Hardware.png)

---

### **2. Software Embarcado na ESP**

O ESP32 executa um sistema embarcado desenvolvido especificamente para este projeto, sendo responsável por:

- realizar leituras periódicas dos sensores;
- organizar o funcionamento interno em tarefas separadas (FreeRTOS);
- manter a conexão Wi-Fi ativa com tentativa de reconexão;
- disponibilizar as variáveis ambientais na rede por meio do **protocolo SNMP**, operando como **Agente SNMP**.

---

### **3. Serviço de Coleta, armazenamento no Banco de Dados e Alertas SMTP**

No servidor roda um serviço desenvolvido em Python, responsável por:

- consultar periodicamente a ESP32 via SNMP;
- registrar cada leitura em um **banco de dados MySQL**;
- verificar condições de alerta (ex.: temperatura acima do limite configurado);
- enviar notificações por e-mail via **SMTP** sempre que necessário.

Essa organização permite manter um histórico completo das variáveis coletadas e automatizar o processo de notificação.

A figura seguinte apresenta o fluxo lógico entre os módulos:

![Fluxo geral de comunicação entre os módulos do sistema](Imagens/Fluxo%20geral%20de%20comunicação%20entre%20os%20módulos%20do%20sistema.png)

---

### **4. Aplicação Web e Interação com Usuários**

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

# Estrutura do Projeto

A organização das pastas e arquivos segue um padrão simples e objetivo para facilitar manutenção, execução e entendimento do sistema de monitoramento.

README.md

Imagens/

monitoramento/

│

├── static/

│   └── image.jpg

│

├── templates/

│   ├── acima23.html

│   ├── index.html

│   └── instantaneo.html

│

├── @.env

├── Atualizado.ino

├── DDL_leitura.sql

├── app.py

├── coletor_snmp.py

├── modelo3d.f3d

├── requirements.txt




---

## **/static/**
Contém arquivos estáticos usados no painel web.

- **image.jpg**  
  Imagem exibida no rodapé das páginas HTML (ex.: logomarca).

Esses arquivos são servidos pelo Flask usando `url_for('static', filename='...')`.

---

## **/templates/**
Contém todas as páginas HTML renderizadas pelo Flask.

- **index.html** – Página da *Série Histórica* com gráficos de temperatura e umidade.  
- **instantaneo.html** – Página *Tempo Real*, leitura SNMP direta da ESP32.  
- **acima23.html** – Página do *Log de Eventos*, exibindo leituras acima do limiar.

Todas utilizam o sistema de navegação por abas (Tempo Real, Série Histórica, Log de Eventos).

---

## **Atualizado.ino**
Arquivo de firmware para a **ESP32**, responsável por:

- ler os sensores DHT11 e DHT22  
- exibir dados no display OLED  
- publicar temperatura e umidade via SNMP  
- gerenciar reconexão Wi-Fi  
- executar tarefas via FreeRTOS  

Este arquivo deve ser enviado para a placa ESP32 usando a IDE Arduino.

---

## **DDL_leitura.sql**
Script SQL que:

- cria o banco de dados  
- cria a tabela de leituras  
- cria um usuário com acesso somente SELECT

O arquivo é genérico e permite personalização de nomes e credenciais.

---

## **app.py**
Aplicação **Flask** que:

- disponibiliza todas as páginas HTML  
- fornece APIs JSON para os gráficos (`/api/...`)  
- consulta leituras no MySQL  
- exibe leituras da ESP32 em tempo real via SNMP  

É a interface web do sistema como um todo.

---

## **coletor_snmp.py**
Serviço Python que:

- consulta a ESP32 via SNMP periodicamente  
- grava as leituras no MySQL  
- envia alertas por e-mail quando limites são ultrapassados  
- executa continuamente e registra logs  

Todas as configurações vêm do arquivo **@.env**.

---

## **@.env**
Arquivo com todas as configurações externas:

- IP da ESP32  
- comunidade SNMP  
- OIDs dos sensores  
- credenciais MySQL  
- limiares de alerta  
- configurações SMTP  
- porta do servidor Flask  

O usuário deve ajustar este arquivo antes de rodar o sistema.

---

## **requirements.txt**
O sistema usa apenas três bibliotecas Python:

- **Flask** – para rodar a aplicação web.
- **mysql-connector-python** – para conectar ao banco MySQL.
- **python-dotenv** – para carregar variáveis do arquivo `.env`.

Essas três dependências são suficientes para executar todo o projeto.


