docker-mosquitto
================

Docker image for mosquitto configured to be used as part of push infrastructure for [moVirt](https://github.com/matobet/moVirt)

## Run

	docker run -ip 1883:1883 matobet/mosquitto


Exposes Port 1883

Volumes: /mqtt/config, /mqtt/data and /mqtt/log


