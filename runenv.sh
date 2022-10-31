#!/bin/bash

# 環境執行腳本

export $(cat .env)

docker-compose down
docker-compose up -d