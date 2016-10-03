/*
 * RAW HTTP GET
 */

#include <Arduino.h>
#include <ESP8266WiFi.h>
#include <ESP8266WiFiMulti.h>

ESP8266WiFiMulti wifi;

const char* ssid = "<SSID>";
const char* password = "<PASSWORD>";
const char* host = "<HOST>";
const chat* url = "<URL>";
const int port = 80;

void setup() {
    Serial.begin(115200);
    wifi.addAP(ssid, password);
}

void loop() {
    WiFiClient client;

    if (!client.connect(host, port)) {
        Serial.println("[WiFi] connection failed");
        return;
    }

    client.println(String("GET ") + url + " HTTP/1.1");
    client.println(String("Host: ") + host);
    client.println("Connection: close");
    client.println();

    Serial.println("[WiFi] request sent");
    while (client.connected()) {
      String line = client.readStringUntil('\n');
      Serial.println(line);
    }

    delay(10000);
}
