#!/bin/bash

# 啟動腳本

export $(cat .env)

# 更新code到最新
docker exec -it $BOT_NAME /bin/bash -c "GIT_SSH_COMMAND=\"ssh -o StrictHostKeyChecking=no\" git pull origin HEAD"

# 先停止機器人, 不然記憶體不夠使用...
./hotstop.sh

# build code
docker exec -it $BOT_NAME /bin/bash -c "npm i"
docker exec -it $BOT_NAME /bin/bash -c "npm run build"
docker exec -it $BOT_NAME /bin/bash -c "sed -i -e 's/\r$//' run.sh"
docker exec -it $BOT_NAME /bin/bash -c "chmod +x *.sh"

# 啟動服務
docker exec -d $BOT_NAME /bin/bash -c "./run.sh > /proc/1/fd/1"
