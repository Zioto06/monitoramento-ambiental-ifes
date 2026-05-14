# Monitoramento Ambiental IFES

> Esse projeto consiste no sistema de monitoramento ambiental desenvolvido para salas de servidores, utilizando [ESP32](https://www.espressif.com/en/products/socs/esp32) como `agente SNMP`, serviço de coleta em Python, armazenamento em banco de dados e visualização via aplicação web. 
>
> O rojeto foi desenvolvido no IFES, Campus Guarapari, na disciplina de Projetos Aplicados.
>
> Integrantes:
>
> - Daniel Prezotti Marchesi
> - Gustavo Delpupo Ribeiro
> - João Pedro Queiroz dos Santos 
> - Luis Philipe Zioto de Barros
>
> Orientador:
> - Bruno Neves Amigo
>
---

# Visão Geral

Este projeto realiza o monitoramento contínuo de temperatura e umidade utilizando sensores DHT acoplados a um ESP32, que atua como `agente SNMP`. Um serviço em Python consulta periodicamente o dispositivo, grava os registros em um banco MySQL e disponibiliza uma `aplicação web` para visualização em tempo real, análise histórica e log de eventos acima dos limiares configurados. O sistema possui:

- Monitoramento contínuo (ESP32 + DHT);
- Consulta remota em tempo real (SNMP GET);
- Registro histórico em banco de dados;
- Alertas via e-mail (SMTP);
- Gráficos de série histórica;
- Log de eventos críticos;
- Interface web desenvolvida com Flask + Chart.js.

---

# Arquitetura do Sistema

A arquitetura do sistema segue estruturada em partes que funcionam de forma integrada para permitir o monitoramento ambiental em tempo real. Cada camada possui uma função específica dentro do fluxo geral do sistema, desde o sensoriamento físico até a visualização dos dados pelo usuário final.

---

## 1. Estrutura de Hardware

Essa camada é responsável pela aquisição das variáveis ambientais. Ela é composta pelos sensores digitais `DHT11` e `DHT22`, conectados a um `ESP32` (via one-wire), além de um `display OLED` (via I2C) utilizado para exibição local e um botão físico para ativar/desativar o display.

A imagem a seguir apresenta a organização do módulo de hardware:

<div align="center">
  
![Estrutura geral do Hardware](Imagens/Estrutura%20geral%20do%20Hardware.png)

</div>

---

## 2. Software Embarcado na ESP

O ESP32 executa um sistema embarcado desenvolvido especificamente para este projeto, sendo responsável por:

- Realizar leituras periódicas dos sensores;
- Organizar o funcionamento interno em tarefas separadas (FreeRTOS);
- Manter a conexão Wi-Fi ativa com tentativa de reconexão;
- Disponibilizar as variáveis ambientais na rede por meio do **protocolo SNMP**, operando como **Agente SNMP**.

---

## 3. Serviço de Coleta, Armazenamento no Banco de Dados e Alertas SMTP

No servidor roda um serviço desenvolvido em Python, responsável por:

- Consultar periodicamente a ESP32 via SNMP;
- Registrar cada leitura em um `banco de dados MySQL;
- Verificar condições de alerta (ex.: temperatura acima do limite configurado);
- Enviar notificações por e-mail via `SMTP` sempre que necessário.

Essa organização permite manter um histórico completo das variáveis coletadas e automatizar o processo de notificação.

A figura seguinte apresenta o fluxo lógico entre os módulos:

<div align="center">

![Fluxo geral de comunicação entre os módulos do sistema](Imagens/Fluxo%20geral%20de%20comunicação%20entre%20os%20módulos%20do%20sistema.png)

</div>

---

## 4. Aplicação Web e Interação com Usuários

A aplicação web funciona como o módulo de apresentação, permitindo ao usuário:

- Visualizar as medições em `tempo real` diretamente da ESP32;
- Acessar gráficos com `todas as leituras armazenadas` no banco de dados;
- Consultar registros específicos de valores acima do limite definido.

A aplicação organiza e exibe as informações de modo simples, atualizável e acessível via navegador.

A figura abaixo resume a interação entre a aplicação e os demais componentes:

<div align="center">
  
![Interação da aplicação web com os módulos do sistema](Imagens/Interação%20da%20aplicação%20web%20com%20os%20módulos%20do%20sistema.png)

</div>

---

# Estrutura do Projeto e Descrição dos Arquivos

A organização das pastas e arquivos segue um padrão simples e objetivo para facilitar manutenção, execução e entendimento do sistema de monitoramento.

README.md

Imagens/

monitoramento/

```bash
static/
└── image.jpg

templates/
├── acima23.html
├── index.html
└── instantaneo.html

├── env
├── Atualizado.ino
├── DDL_leitura.sql
├── PA3.sch
├── app.py
├── coletor_snmp.py
├── modelo3d.f3d
└── requirements.txt
```


---

## static
Contém arquivos estáticos usados no painel web.

- image.jpg: Imagem exibida no rodapé das páginas HTML.

---

## templates
Contém todas as páginas HTML renderizadas pelo Flask.

- **index.html**: Página da *Série Histórica* com gráficos de temperatura e umidade.  
- **instantaneo.html**: Página *Tempo Real*, leitura SNMP direta da ESP32.  
- **acima23.html**: Página do *Log de Eventos*, exibindo leituras acima do limiar.

Todas utilizam o sistema de navegação por abas (Tempo Real, Série Histórica, Log de Eventos).

---

## Atualizado.ino
Arquivo de firmware para a ESP32, responsável por:

- Ler os sensores DHT11 e DHT22;  
- Exibir dados no display OLED;  
- Publicar temperatura e umidade via SNMP;  
- Gerenciar reconexão Wi-Fi;  
- Executar tarefas via FreeRTOS. 

Este arquivo deve ser enviado para a placa ESP32.

---

## DDL_leitura.sql
Script SQL que:

- Cria o banco de dados;  
- Cria a tabela de leituras;  
- Cria um usuário com acesso somente SELECT.

O arquivo é genérico e permite personalização de nomes e credenciais.

---

## PA3.sch

Arquivo de esquema elétrico criado no Autodesk EAGLE, contendo o circuito de interligação entre microcontrolador, sensores, display e demais componentes do protótipo.

---

## app.py
Aplicação Flask que:

- Disponibiliza todas as páginas HTML;  
- Fornece APIs JSON para os gráficos (`/api/...`);  
- Consulta leituras no MySQL;  
- Exibe leituras da ESP32 em tempo real via SNMP.  

É a interface web do sistema como um todo.

Todas as configurações vêm do arquivo @.env.

---

## coletor_snmp.py
Serviço Python que:

- Consulta a ESP32 via SNMP periodicamente;  
- Grava as leituras no MySQL;  
- Envia alertas por e-mail quando limites são ultrapassados;  
- Executa continuamente e registra logs.  

Todas as configurações vêm do arquivo `env`.

---

## modelo3d.f3d

Arquivo de modelagem tridimensional desenvolvido no Autodesk Fusion 360, representando o invólucro da caixa utilizado para acomodar e fixar o módulo de hardware.

---

## env
Arquivo com todas as configurações externas:

- IP da ESP32;  
- Comunidade SNMP;  
- OIDs dos sensores;  
- Credenciais MySQL;  
- Limiares de alerta;  
- Configurações SMTP;  
- Porta do servidor Flask.  

*O usuário deve ajustar este arquivo antes de rodar o sistema*.

---

## requirements.txt
O sistema usa apenas três bibliotecas Python:

- **Flask**: para rodar a aplicação web.
- **mysql-connector-python**: para conectar ao banco MySQL.
- **python-dotenv**: para carregar variáveis do arquivo `.env`.

Essas três dependências são suficientes para executar todo o projeto.
