#!/bin/bash

# 停止腳本

BOT_NAME=z-bot

docker exec -it BOT_NAME /bin/bash -c "pkill -9 -P $(pgrep run.sh) 2> /dev/null"
docker exec -it BOT_NAME /bin/bash -c "pkill -9 java"
docker exec -it BOT_NAME /bin/bash -c "pkill -9 node"