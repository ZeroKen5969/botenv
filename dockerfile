FROM mcr.microsoft.com/dotnet/runtime-deps:8.0

WORKDIR /bot

ENV NODE_VERSION=18.20.8
ENV JAVA_HOME=/usr/java/jdk-24.0.1
ENV PATH=${PATH}:${JAVA_HOME}/bin:/usr/node/v${NODE_VERSION}/bin

RUN apt-get update && \
    apt-get install -y curl && \
    apt-get install -y git && \
    apt-get install -y libfontconfig && \
    apt-get install -y procps && \
    # 建立暫存資料夾
    mkdir pkg && cd pkg && \
    # 安裝node.js
    mkdir /usr/node && \
    curl -LO https://nodejs.org/dist/v${NODE_VERSION}/node-v${NODE_VERSION}-linux-x64.tar.gz && \
    tar xvf ./node-v${NODE_VERSION}-linux-x64.tar.gz && \
    /bin/mv -f node-v${NODE_VERSION}-linux-x64/ /usr/node/v${NODE_VERSION} && \
    # 安裝java
    # mkdir /usr/java && \
    # curl -LO https://download.oracle.com/java/24/latest/jdk-24_linux-x64_bin.tar.gz && \
    # tar xvf ./jdk-24_linux-x64_bin.tar.gz && \
    # /bin/mv -f jdk-24.0.1/ /usr/java/jdk-24.0.1 && \ 
    # 清空暫存資料夾
    cd .. && rm -rf pkg
