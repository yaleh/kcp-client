# This dockerfile uses the ubuntu image
# Author: Yale Huang
# Command format: Instruction [arguments / command] ..

# Base image to use, this must be set as the first line
FROM alpine 

MAINTAINER Yale Huang <calvino.huang@gmail.com>

# Commands to update the image
RUN apk add --update wget && rm -rf /var/cache/apk/*

RUN mkdir -p /opt/kcptun && \
	wget -O /root/kcptun-linux-amd64.tar.gz --no-check-certificate https://github.com/xtaci/kcptun/releases/download/v20160524/kcptun-linux-amd64-20160524.tar.gz && \
	cd /opt/kcptun && \
	tar xvfz /root/kcptun-linux-amd64.tar.gz client_linux_amd64 && \
	rm /root/kcptun-linux-amd64.tar.gz

ENV SERVER=127.0.0.1 SERVER_PORT=4000 KCP_PASSWORD=password MTU=1350 SNDWND=128 RCVWND=1024 \
	MODE=fast
EXPOSE 1083/tcp

CMD /opt/kcptun/client_linux_amd64 -r $SERVER:$SERVER_PORT -l ":1083" --key "${KCP_PASSWORD}" --mtu $MTU \
	--sndwnd $SNDWND --rcvwnd $RCVWND --mode $MODE

