#!/bin/bash

# 停止腳本

export $(cat .env)

docker exec -it $BOT_NAME /bin/bash -c "pkill -9 -P $(pgrep run.sh) 2> /dev/null"
docker exec -it $BOT_NAME /bin/bash -c "pkill -9 java"
docker exec -it $BOT_NAME /bin/bash -c "pkill -9 node"