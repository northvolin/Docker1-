#!/bin/bash

gcc Hello.c -lfcgi -o hello
spawn-fcgi -p 8080 hello

nginx -t
nginx -s reload
nginx -g "daemon off;"