#!/usr/bin/env bash

cd /backup/my-app/target
nohup /usr/bin/java -jar -Dserver.port=9090 \
    *.jar > /dev/null 2> /dev/null < /dev/null &