# This dockerfile uses the ubuntu image
# Author: Yale Huang
# Command format: Instruction [arguments / command] ..

# Base image to use, this must be set as the first line
FROM ubuntu

MAINTAINER Yale Huang <calvino.huang@gmail.com>

# Commands to update the image
RUN apt-get -y update && apt-get -y upgrade

RUN apt-get install wget -y
RUN wget -O /root/kcptun-linux-amd64.tar.gz https://github.com/xtaci/kcptun/releases/download/v20160524/kcptun-linux-amd64-20160524.tar.gz
RUN mkdir -p /opt/kcptun && cd /opt/kcptun && tar xvfz /root/kcptun-linux-amd64.tar.gz

ENV SERVER=127.0.0.1 SERVER_PORT=4000 KCP_PASSWORD=password MTU=1350 SNDWND=128 RCVWND=1024 \
        MODE=fast
EXPOSE 1083/tcp

CMD /opt/kcptun/client_linux_arm7 -r $SERVER:$SERVER_PORT -l ":1083" --key "${KCP_PASSWORD}" --mtu $MTU \
        --sndwnd $SNDWND --rcvwnd $RCVWND --mode $MODE

