#!/bin/bash

# 啟動腳本

export $(cat .env)

SKIP_BUILD=$1

# 更新code到最新
docker exec $BOT_NAME /bin/bash -c "
GIT_SSH_COMMAND=\"ssh -o StrictHostKeyChecking=no\" git fetch --all;
git reset --hard origin/master;
git pull origin master;"

# 先載module, 避免下載花太長時間
docker exec $BOT_NAME /bin/bash -c "npm i"

# build前先停止機器人, 不然記憶體不夠使用...
./hotstop.sh

# build code
if [ "$SKIP_BUILD" != true ]; then
    docker exec $BOT_NAME /bin/bash -c "rm -rf ./built"
    docker exec $BOT_NAME /bin/bash -c "npm run build"
fi
docker exec $BOT_NAME /bin/bash -c "sed -i -e 's/\r$//' run.sh"
docker exec $BOT_NAME /bin/bash -c "chmod +x *.sh"

# 啟動服務
docker exec -d $BOT_NAME /bin/bash -c "./run.sh &> /proc/1/fd/1"
