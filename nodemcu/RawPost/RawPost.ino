/*
 * RAW HTTP POST
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
    String data = "{ \"measure\": { \"type\": \"humidity\", \"value\": \"42\" } }";

    if (!client.connect(host, port)) {
        Serial.println("[WiFi] connection failed");
        return;
    }

    client.println(String("POST ") + url + " HTTP/1.1");
    client.println(String("Host: ") + host);
    client.println("Cache-Control: no-cache");
    client.println("Content-Type: application/json");
    client.print("Content-Length: ");
    client.println(data.length());
    client.println();
    client.println(data);

    Serial.println("[WiFi] request sent");
    while (client.available()) {
      String line = client.readStringUntil('\r');
      Serial.print(line);
    }

    delay(10000);
}
