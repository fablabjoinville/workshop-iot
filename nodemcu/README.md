# NodeMCU ESP8266

[NodeMCU](https://github.com/nodemcu/nodemcu-devkit-v1.0) é uma plataforma open source para IoT. Seu firmware roda ESP8266 Wi-Fi e o hardware é baseado no módulo `ESP-12`. Por padrão a plataforma NodeMCU é baseada na linguagem eLua, porém vamos utilizar o ambiente Arduino para sua programação. Você pode encontrar mais detalhes sobre o Arduino ESP8266 no [repositório git da comunidade](https://github.com/esp8266/Arduino).

![alt text](https://raw.githubusercontent.com/fablabjoinville/iot/master/nodemcu/docs/assets/nodemcu.jpg "NodeMCU ESP8266")

## Dependências

* [Arduino](http://arduino.cc)
* Driver [MAC OS](http://www.wch.cn/download/CH341SER_MAC_ZIP.html), [LINUX](http://www.wch.cn/download/CH341SER_LINUX_ZIP.html), [WINDOWS](http://www.wch.cn/download/CH341SER_ZIP.html)

## Desenvolvimento

Inicie a IDE do Arduino e abra as Preferências. Adicione a URL `http://arduino.esp8266.com/stable/package_esp8266com_index.json` no campo `Additional Board Manager URLs`. Aperte OK. Abra o `Boards Manager` no menu `Tools > Board` e instale a plataforma `esp8266`. Após a instalação, selecione `ESP8266` em `Tools > Board`.

Você pode configurar sua placa para desenvolvimento usando OTA (Over the Air). Dessa forma você não precisa ter uma conexão física com o computador para fazer o upload dos seus sketches Arduino. Veja a [documentação](https://github.com/esp8266/Arduino/blob/master/doc/ota_updates/readme.md#arduino-ide) para mais detalhes.

### Cliente HTTP

### Cliente MTQQ

### CLiente CoAP

## Documentação e Referências

* [NodeMCU Documentation](nodemcu.readthedocs.io)
* [HTTP Module Documentation](https://nodemcu.readthedocs.io/en/dev/en/modules/http/)
* [CoAP Module Documentation](https://nodemcu.readthedocs.io/en/dev/en/modules/coap/)
* [MQTT Module Documentation](https://nodemcu.readthedocs.io/en/dev/en/modules/mqtt/)
* [Repositório Git NodeMCU](https://github.com/nodemcu)
* [ESP8266 Community Forum](https://github.com/esp8266)
