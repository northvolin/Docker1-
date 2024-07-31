# Simple Docker

## Part 1. Ready-made docker
#### - Взять официальный докер образ с nginx и выкачать его при помощи `docker pull`
![nginx](src/screenshots/01.png)

#### - Проверить наличие докер образа через `docker images`
![nginx](src/screenshots/02.png)

#### - Запустить докер образ через `docker run -d [image_id|repository]` и проверить, что образ запустился через `docker ps`
![Docker run](src/screenshots/03.png)

#### - Посмотреть информацию о контейнере через `docker inspect [container_id|container_name]`
![Docker inspect](src/screenshots/04.png)

#### - По выводу команды определить и поместить в отчёт `размер контейнера`, `список замапленных портов` и `ip` контейнера
![Docker size](src/screenshots/05.png)
>***SizeRootFs***: This indicates the total bytes of all files inside the container.
>***sizeRw***: This measures the added or changed file size in bytes within the container compared to its original image.

![Docker size](src/screenshots/06.png)
>***Port mapping*** - это переадресация принимаемых данных таким образом, чтобы данные, принимаемые на какой-то порт одного
>компьютера автоматически переадресовывались на какой-то другой порт другого компьютера.

#### - Остановить докер образ через `docker stop [container_id|container_name]` и  остановить докер образ через docker stop [container_id|container_name]
![Container Stop](src/screenshots/07.png)

#### - Запустить докер с портами `80 и 443` в контейнере, замапленными на такие же порты на локальной машине, через команду `run`
![Set Ports](src/screenshots/08.png)

-d - это флаг, указывающий Docker запустить контейнер в фоновом режиме (detached mode), что означает,
что контейнер будет работать в фоновом режиме и не будет привязан к текущему терминалу.
-p 80:80 - это опция для проброса портов (port mapping).
Она указывает Docker на привязку порта 80 внутри контейнера к порту 80 на локальной машине.
-p 443:443 - это также опция для проброса портов, 
которая привязывает порт 443 внутри контейнера к порту 443 на локальной машине.
nginx - это имя образа Docker, на основе которого будет создан новый контейнер. 
В данном случае мы используем образ Nginx, который является веб-сервером.
После выполнения этой команды Docker создаст новый контейнер,
основанный на образе Nginx, и привяжет порты 80 и 443 внутри контейнера 
к портам 80 и 443 на нашей локальной машине. 
Контейнер будет работать в фоновом режиме, и мы сможем использовать наш локальный
веб-браузер для доступа к веб-серверу, запущенному в контейнере.

#### - Проверить, что в браузере по адресу `localhost:80` доступна стартовая страница nginx
![Welcome](src/screenshots/10.png)

#### - Перезапустить докер контейнер через `docker restart [container_id|container_name]`. Проверить любым способом, что контейнер запустился
![Restart](src/screenshots/09.png)


## Part 2. Operations with container
#### - Прочитать конфигурационный файл nginx.conf внутри докер контейнера через команду `exec`
![](src/screenshots/11EXEC.png)

#### - Создать на локальной машине файл `nginx.conf`
![](src/screenshots/12nginxconf.png)

#### - Настроить в нем по пути `/status` отдачу страницы статуса сервера nginx
![](src/screenshots/13confinside.png)

#### - Скопировать созданный файл `nginx.conf` внутрь докер образа через команду `docker cp`. Перезапустить nginx внутри докер образа через команду `exec`
![](src/screenshots/14confrestart.png)

#### - Проверить, что по адресу `localhost:80/status` отдается страничка со статусом сервера nginx
![](src/screenshots/15nginxconf.png)

#### - Экспортировать контейнер в файл container.tar через команду `export`
![](src/screenshots/16tar.png)

#### - Остановить контейнер
![](src/screenshots/17stopCont.png)

#### - Удалить образ через `docker rmi [image_id|repository]`, не удаляя перед этим контейнеры. Затем удалить остановленный контейнер
![](src/screenshots/18RmRf.png)

#### - Импортировать контейнер обратно через команду `import`
![](src/screenshots/19ImportCont.png)
>***-c flag*** (--change) - import with new configurations

> ***CMD*** — описывает команду с аргументами, которую нужно выполнить когда контейнер будет запущен. Аргументы могут быть переопределены при запуске контейнера.

> ***-g flag*** - nginx argument; used for specifying NGINX flags specifically `daemon off`

>  ***daemon off*** - directive tells Nginx to stay in the foreground (used for Docker containers).
> Daemon - занимаются такими вещами, как сетевые запросы, работой аппаратного обеспечения и прочими заданиями

#### - Запустить импортированный контейнер
![](src/screenshots/20UP.png)

#### -Проверить, что по адресу `localhost:80/status` отдается страничка со статусом сервера nginx
![](src/screenshots/21local.png)

## Part 3. Mini web server

#### - Написать мини сервер на `C` и `FastCgi`, который будет возвращать простейшую страничку с надписью `Hello World!`
![](src/screenshots/22CproG.png)

#### - Написать свой `nginx.conf`, который будет проксировать все запросы с `81` порта на `127.0.0.1:8080`
![](src/screenshots/23ConfFile.png)

#### - Качаем образ nginx, запускаем контейнер, копируем c файл сервера и conf файл nginx
![](src/screenshots/24DockerRun81.png)
![](src/screenshots/25CopYtoDocker.png)

#### - Заходим в контейнер через интерактиный режим, обновляем репозитории, устанавливаем `gcc, spawn-fcgi и libfcgi-dev`
![](src/screenshots/26GoInDocker.png)
![](src/screenshots/28InstallFCG.png)
> ***spawn-fcgi*** - используется для запуска удаленных и локальных FastCGI процессов

> ***libfcgi-dev*** - This package contains the header files, symlinks and static libraries which are needed to develop applications based on libfcgi

#### - Компилируем и запускаем сервер
![](src/screenshots/29compile.png)

#### - проверяем нашу страничку
![](src/screenshots/29HelloWorld.png)

## Part 4. Your own docker
#### - Написать свой докер образ, который:

1) Собирает исходники мини сервера на FastCgi из Части 3
2) Запускает его на 8080 порту
3) Копирует внутрь образа написанный ./nginx/nginx.conf
4) Запускает nginx.

#### - Создаём скрипт, выполняющий роль entrypoint
![](src/screenshots/31Script.png)
> ***daemon-off***

#### - Создаём докерфайл
![](src/screenshots/30Dockerfile.png)

#### - Собрать образ через `docker build` при этом указав имя и тег
![](src/screenshots/23BuildDocker.png)

#### - Проверить через `docker images`, что все собралось корректно
![](src/screenshots/21Dockercheck.png)
> ***-v*** - mounts the specified directory on the host inside the container at the specified path

>***-it*** - starts the container in the interactive mode (hence -it flag) that allows you to interact with /bin/bash of the container. That means now you will have bash session inside the container, so you can ls, mkdir, or do any bash command inside the container


#### - Проверить, что по `localhost:80` доступна страничка написанного мини сервера
![](src/screenshots/25AutoDocker.png)

#### - Дописать в `./nginx/nginx.conf` проксирование странички `/status`, по которой надо отдавать статус сервера `nginx`
![](18StatusConfig.png)

#### - Сделать команду nginx `-s reload` и проверить статус через `localhost/status`
![](src/screenshots/25AfterReload.png)
![](src/screenshots/11StatusAutoDoc.png)

## Part 5. Dockle
#### - Установить `Dockle`
![](src/screenshots/33DockleInst.png)
#### - Проверить образ
![](src/screenshots/42Docklecheck.png)
#### - Исправить ошибки в Dockerfile
![](src/screenshots/33FixDockFile.png)

![](src/screenshots/28FixedDockle.png)
#### - Ошибки утсранены

## Part 6. Basic Docker Compose

> `Docker` применяется для управления отдельными контейнерами (сервисами), из которых состоит приложение.

> `Docker Compose` используется для одновременного управления несколькими контейнерами, входящими в состав приложения. Этот инструмент предлагает те же возможности, что и Docker, но позволяет работать с более сложными приложениями

#### - Установить утилиту `docker-compose`
![](src/screenshots/38Compose.png)

#### - Изменить конфигурационные файлы
![](src/screenshots/39HostConf.png)
> nginx.conf

![](src/screenshots/49DockerCompot.png)
> docker-compose.yml

![](src/screenshots/44DockerFilFinal.png)
> Dockerfile

![](src/screenshots/45Script.png)
> run.sh

#### - Сбилдить контейнер командой `docker-compose build`
![](src/screenshots/43COMPOTBUILD.png)

#### - Поднять контенйеры с помощью `docker compose up`
![](src/screenshots/44CompotUP.png)

#### - Проверить `localhost`
![](src/screenshots/44NoWay.png)
