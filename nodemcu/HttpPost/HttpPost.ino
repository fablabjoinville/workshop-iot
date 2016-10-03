/*
 * ESP8266HTTPClient
 * HTTP POST
 */

#include <Arduino.h>
#include <ESP8266WiFi.h>
#include <ESP8266WiFiMulti.h>
#include <ESP8266HTTPClient.h>

ESP8266WiFiMulti wifi;

void setup() {
    Serial.begin(115200);
    wifi.addAP("<SSID>", "<PASSWORD>");
}

void loop() {
    if (wifi.run() == WL_CONNECTED) {
        HTTPClient http;
        http.begin("<SERVER>");
        http.addHeader("Content-Type", "application/json");

        int httpCode = http.POST("{ \"measure\": { \"type\": \"humidity\", \"value\": \"42\" } }");
        Serial.printf("[HTTP] code: %d\n", httpCode);

        if (httpCode == HTTP_CODE_CREATED) {
            String payload = http.getString();
            Serial.println("[HTTP] payload");
            Serial.println(payload);
        } else {
            Serial.printf("[HTTP] error: %s\n", http.errorToString(httpCode).c_str());
        }

        http.end();
    }

    delay(10000);
}
