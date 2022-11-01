# 建置需求
+ [docker](https://docs.docker.com/engine/install/ubuntu/)
+ docker-compose
```
sudo curl -L "https://github.com/docker/compose/releases/download/v2.12.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
```

# 環境建置

```bash
git clone git@github.com:ZeroKen5969/botenv.git

cd botenv

git clone git@github.com:ZeroKen5969/Z-Bot.git bot

chmod +x *

./buildenv.sh && ./runenv.sh
```

# 啟動機器人

+ 會重新執行build code
```bash
./start.sh
```
+ 不會重新執行build code, 給github action用的
```bash
./hotstart.sh
```

# 停止機器人

+ 先前日誌會清除, 空間不足時使用
```bash
./stop.sh
```
+ 會保留先前日誌, 速度也更快
```bash
./hotstop.sh
```

# 查看日誌

```bash
 docker logs z-bot -f -n 300
```
