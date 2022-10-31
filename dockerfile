FROM ubuntu:22.04

WORKDIR /bot

ENV NODE_VERSION=17.9.1
ENV JAVA_HOME=/usr/java/jdk-13.0.2
ENV PATH=${PATH}:${JAVA_HOME}/bin:/usr/node/v17.9.1/bin

RUN apt-get update && \
    apt-get install -y curl && \
    apt-get install -y git && \
    apt-get install -y libfontconfig && \
    # 建立暫存資料夾
    mkdir pkg && cd pkg && \
    # 安裝node.js
    mkdir /usr/node && \
    curl -LO https://nodejs.org/dist/v${NODE_VERSION}/node-v${NODE_VERSION}-linux-x64.tar.gz && \
    tar xvf ./node-v${NODE_VERSION}-linux-x64.tar.gz && \
    /bin/mv -f node-v${NODE_VERSION}-linux-x64/ /usr/node/v${NODE_VERSION} && \
    # 安裝java
    mkdir /usr/java && \
    curl -LO https://download.java.net/java/GA/jdk13.0.2/d4173c853231432d94f001e99d882ca7/8/GPL/openjdk-13.0.2_linux-x64_bin.tar.gz && \
    tar xvf ./openjdk-13.0.2_linux-x64_bin.tar.gz && \
    /bin/mv -f jdk-13.0.2/ /usr/java/jdk-13.0.2 && \ 
    # 清空暫存資料夾
    cd .. && rm -rf pkg