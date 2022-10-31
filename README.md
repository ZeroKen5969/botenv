# 環境建置

```bash
git clone git@github.com:ZeroKen5969/botenv.git

cd botenv

git clone git@github.com:ZeroKen5969/Z-Bot.git bot

chmod +x *

./buildenv.sh && ./runenv.sh
```

# 啟動機器人

```bash
./start.sh
```

# 停止機器人

```bash
./stop.sh
```

# 查看日誌

```bash
 docker logs z-bot -f -n 300
```
