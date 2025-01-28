#!/bin/sh

mkspiffs-0.2.3-esp-idf-linux-armhf/mkspiffs -c data -s 131072 -p 256 -b 4096 spiffs.bin
python3 /usr/local/bin/esptool.py --chip esp32 --port /dev/ttyACM0 --baud 921600 --before default_reset --after hard_reset write_flash -z --flash_mode dio --flash_freq 40m --flash_size 4MB 3997696 spiffs.bin