/*******************************************************
 * PROJETO Monitoramento Ambiental – ESP32 + SNMP + OLED
 * FUNÇÕES:
 *  - Lê temperatura/umidade (DHT11/DHT22)
 *  - Exibe no OLED (SSD1306, I²C)
 *  - Publica via SNMP (UDP/161) como inteiros escalados (×10)
 *  - Estrutura com FreeRTOS: tarefa dedicada à leitura do sensor
 *
 *  PONTOS PARA CONFIGURAR
 *   - WIFI_SSID / WIFI_PASSWORD
 *   - Pinos dos DHT se forem diferentes
 *   - Endereço I2C do OLED se não for 0x3C
 *   - OIDs SNMP, se quiser mudar a árvore
 *******************************************************/

 /*******************************************************
 * BIBLIOTECAS NECESSÁRIAS PARA O CÓDIGO DA ESP32
 *
 * - WiFi.h               (já incluída no core ESP32)
 * - WiFiUdp.h            (já incluída no core ESP32)
 * - Wire.h               (já incluída no core ESP32)
 *
 * - DHT.h                -> instalar: "DHT sensor library" (Adafruit)
 * - Adafruit_GFX.h       -> instalar: "Adafruit GFX Library"
 * - Adafruit_SSD1306.h   -> instalar: "Adafruit SSD1306"
 *
 * - SNMP_Agent.h         -> instalar manualmente (biblioteca externa para SNMP)
 *
 * OBS.: O código deve ser compilado usando ESP32 Core 2.x na IDE Arduino.
 *******************************************************/


#include <WiFi.h>
#include <WiFiUdp.h>
#include <SNMP_Agent.h>
#include <DHT.h>
#include <Wire.h>
#include <Adafruit_GFX.h>
#include <Adafruit_SSD1306.h>

/********** DISPLAY OLED (I2C) **********/
#define SCREEN_WIDTH 128
#define SCREEN_HEIGHT 64
#define OLED_RESET    -1
#define OLED_I2C_ADDR 0x3C

// Pinos I2C conforme o SEU hardware (ESP32)
#define OLED_SDA 18
#define OLED_SCL 19

Adafruit_SSD1306 display(SCREEN_WIDTH, SCREEN_HEIGHT, &Wire, OLED_RESET);

/********** SENSORES DHT **********/
// Ajuste os pinos conforme sua montagem
#define DHTPIN1   4      // DHT11
#define DHTTYPE1  DHT11
#define DHTPIN2   2      // DHT22
#define DHTTYPE2  DHT22

DHT dht1(DHTPIN1, DHTTYPE1);
DHT dht2(DHTPIN2, DHTTYPE2);

/********** REDE WI-FI **********/
// ALTERE PARA SUA REDE
const char* ssid     = "SEU_SSID_AQUI";
const char* password = "SUA_SENHA_AQUI";

/********** SNMP **********/
WiFiUDP udp;

// Comunidade pública genérica (pode mudar no seu NMS)
SNMPAgent snmp = SNMPAgent("public", "private");

// 🔧 OIDs SNMP – ajuste se quiser mudar a MIB
const char* OID_TEMPERATURA1 = ".1.3.6.1.4.1.99999.1.0";
const char* OID_UMIDADE1     = ".1.3.6.1.4.1.99999.1.1";
const char* OID_TEMPERATURA2 = ".1.3.6.1.4.1.99999.1.2";
const char* OID_UMIDADE2     = ".1.3.6.1.4.1.99999.1.3";

// Handlers SNMP
ValueCallback* temperature1OID = nullptr;
ValueCallback* humidity1OID    = nullptr;
ValueCallback* temperature2OID = nullptr;
ValueCallback* humidity2OID    = nullptr;

// Variáveis publicadas no SNMP (×10). Use mutex ao acessar!
int temperature1_x10 = 0; // ex.: 251 = 25,1 °C
int humidity1_x10    = 0; // ex.: 678 = 67,8 %
int temperature2_x10 = 0;
int humidity2_x10    = 0;

/********** SINCRONIZAÇÃO (FreeRTOS) **********/
SemaphoreHandle_t xMutex = nullptr;

/********** TAREFA DE LEITURA **********/
void readDHTTask(void * pvParameters);

/********** FUNÇÕES AUXILIARES **********/
void drawBootScreen();
void drawStatusScreen(float t1, float h1, float t2, float h2, bool okRead1, bool okRead2);
void ensureWiFi();

/*******************************************************
 * setup()
 *******************************************************/
void setup() {
  Serial.begin(115200);
  delay(100);

  // I2C + OLED
  Wire.begin(OLED_SDA, OLED_SCL);
  if (!display.begin(SSD1306_SWITCHCAPVCC, OLED_I2C_ADDR)) {
    Serial.println(F("[OLED] Falha na inicialização do SSD1306"));
    for (;;) { delay(1000); }
  }
  display.clearDisplay();
  display.display();
  drawBootScreen();

  // Wi-Fi
  WiFi.mode(WIFI_STA);
  WiFi.begin(ssid, password);
  Serial.printf("[WiFi] Conectando-se a %s\n", ssid);

  int attempts = 0;
  const int max_attempts = 30;
  while (WiFi.status() != WL_CONNECTED && attempts < max_attempts) {
    delay(500);
    Serial.print(".");
    attempts++;
  }
  Serial.println();

  if (WiFi.status() == WL_CONNECTED) {
    Serial.printf("[WiFi] Conectado, IP: %s\n", WiFi.localIP().toString().c_str());
  } else {
    Serial.println("[WiFi] Falha na conexão. Reiniciando em 3s...");
    delay(3000);
    ESP.restart();
  }

  // Mostra IP no OLED
  display.clearDisplay();
  display.setTextSize(1);
  display.setTextColor(SSD1306_WHITE);
  display.setCursor(0, 0);
  display.print("IP: ");
  display.println(WiFi.localIP().toString());
  display.display();

  // Sensores
  dht1.begin();
  dht2.begin();

  // SNMP
  snmp.setUDP(&udp);
  snmp.begin();

  // Registra OIDs (inteiros ×10)
  temperature1OID = snmp.addIntegerHandler(OID_TEMPERATURA1, &temperature1_x10);
  humidity1OID    = snmp.addIntegerHandler(OID_UMIDADE1,     &humidity1_x10);
  temperature2OID = snmp.addIntegerHandler(OID_TEMPERATURA2, &temperature2_x10);
  humidity2OID    = snmp.addIntegerHandler(OID_UMIDADE2,     &humidity2_x10);

  snmp.sortHandlers();

  // Mutex
  xMutex = xSemaphoreCreateMutex();
  if (xMutex == NULL) {
    Serial.println("[RTOS] Falha ao criar mutex. Reiniciando...");
    delay(2000);
    ESP.restart();
  }

  // Tarefa de leitura (3 KB stack, prioridade 1)
  BaseType_t ok = xTaskCreate(
      readDHTTask,
      "ReadDHTTask",
      3072,
      NULL,
      1,
      NULL
  );
  if (ok != pdPASS) {
    Serial.println("[RTOS] Falha ao criar tarefa de leitura. Reiniciando...");
    delay(2000);
    ESP.restart();
  }
}

/*******************************************************
 * loop()
 * - Mantém SNMP e checa Wi-Fi
 *******************************************************/
void loop() {
  ensureWiFi();

  // Processa SNMP com proteção rápida
  if (xSemaphoreTake(xMutex, (TickType_t)10) == pdTRUE) {
    snmp.loop();
    xSemaphoreGive(xMutex);
  }

  vTaskDelay(pdMS_TO_TICKS(10)); // respiro
}

/*******************************************************
 * TAREFA: readDHTTask
 *******************************************************/
void readDHTTask(void * pvParameters) {
  const TickType_t period = pdMS_TO_TICKS(2000); // 2s entre leituras

  for (;;) {
    float t1 = dht1.readTemperature();
    float h1 = dht1.readHumidity();
    float t2 = dht2.readTemperature();
    float h2 = dht2.readHumidity();

    bool ok1 = !(isnan(t1) || isnan(h1));
    bool ok2 = !(isnan(t2) || isnan(h2));

    if (xSemaphoreTake(xMutex, portMAX_DELAY) == pdTRUE) {
      if (ok1) {
        int t1x = (int)(t1 * 10.0f);
        int h1x = (int)(h1 * 10.0f);
        if (t1x > 999) t1x = 999; if (t1x < -999) t1x = -999;
        if (h1x > 999) h1x = 999; if (h1x < 0)    h1x = 0;
        temperature1_x10 = t1x;
        humidity1_x10    = h1x;
      }
      if (ok2) {
        int t2x = (int)(t2 * 10.0f);
        int h2x = (int)(h2 * 10.0f);
        if (t2x > 999) t2x = 999; if (t2x < -999) t2x = -999;
        if (h2x > 999) h2x = 999; if (h2x < 0)    h2x = 0;
        temperature2_x10 = t2x;
        humidity2_x10    = h2x;
      }

      // Atualiza OLED
      drawStatusScreen(t1, h1, t2, h2, ok1, ok2);

      xSemaphoreGive(xMutex);
    }

    vTaskDelay(period);
  }
}

/*******************************************************
 * ensureWiFi()
 *******************************************************/
void ensureWiFi() {
  static unsigned long lastCheck = 0;
  const unsigned long interval = 5000;

  unsigned long now = millis();
  if (now - lastCheck < interval) return;
  lastCheck = now;

  if (WiFi.status() != WL_CONNECTED) {
    Serial.println("[WiFi] Perda de conexão. Tentando reconectar...");
    WiFi.disconnect(true, true);
    WiFi.begin(ssid, password);

    int tries = 0;
    while (WiFi.status() != WL_CONNECTED && tries < 20) {
      vTaskDelay(pdMS_TO_TICKS(10));
      Serial.print(".");
      tries++;
    }
    Serial.println();
    if (WiFi.status() == WL_CONNECTED) {
      Serial.printf("[WiFi] Reconectado. IP: %s\n", WiFi.localIP().toString().c_str());
    } else {
      Serial.println("[WiFi] Sem conexão. Reiniciando em 5s...");
      vTaskDelay(pdMS_TO_TICKS(5000));
      ESP.restart();
    }
  }
}

/*******************************************************
 * drawBootScreen()
 *******************************************************/
void drawBootScreen() {
  display.clearDisplay();
  display.setTextSize(1);
  display.setTextColor(SSD1306_WHITE);
  display.setCursor(0, 0);
  display.println("Monitor Ambiental");
  display.println("ESP32 + SNMP + OLED");
  display.setCursor(0, 24);
  display.println("Conectando Wi-Fi...");
  display.display();
}

/*******************************************************
 * drawStatusScreen(...)
 *******************************************************/
void drawStatusScreen(float t1, float h1, float t2, float h2, bool okRead1, bool okRead2) {
  display.clearDisplay();
  display.setTextSize(1);
  display.setTextColor(SSD1306_WHITE);

  // IP
  display.setCursor(0, 0);
  display.print("IP: ");
  display.println(WiFi.localIP().toString());

  // Sensor 1
  display.setCursor(0, 16);
  display.print("S1 (DHT11):");
  display.setCursor(0, 26);
  if (okRead1) {
    display.print("T1: "); display.print(t1, 1); display.print("C  ");
    display.print("H1: "); display.print(h1, 1); display.println("%");
  } else {
    display.println("T1/H1: ERROR");
  }

  // Sensor 2
  display.setCursor(0, 42);
  display.print("S2 (DHT22):");
  display.setCursor(0, 52);
  if (okRead2) {
    display.print("T2: "); display.print(t2, 1); display.print("C  ");
    display.print("H2: "); display.print(h2, 1); display.print("%");
  } else {
    display.println("T2/H2: ERROR");
  }

  display.display();
}
