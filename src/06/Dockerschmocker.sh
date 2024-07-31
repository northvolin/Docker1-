#!/bin/bash


sudo docker stop $(sudo docker ps -q)

sudo docker rm $(sudo docker ps -a -q)

sudo docker rmi my-app:1.0

sudo netstat -tulnp | grep :8080

sudo docker-compose down --remove-orphan
docker-compose build # Пересобираем образы
docker-compose up # Запускаем контейнеры
