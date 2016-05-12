# This dockerfile uses the ubuntu image
# Author: Yale Huang
# Command format: Instruction [arguments / command] ..

# Base image to use, this must be set as the first line
FROM hypriot/rpi-alpine-scratch 

MAINTAINER Yale Huang <calvino.huang@gmail.com>

# Commands to update the image
RUN apk add --update wget && rm -rf /var/cache/apk/*

RUN mkdir -p /opt/kcptun && \
	wget -O /root/kcptun-linux-arm.tar.gz --no-check-certificate https://github.com/xtaci/kcptun/releases/download/v20160507/kcptun-linux-arm-20160507.tar.gz && \
	cd /opt/kcptun && \
	tar xvfz /root/kcptun-linux-arm.tar.gz client_linux_arm7 && \
	rm /root/kcptun-linux-arm.tar.gz

EXPOSE 1083/tcp

CMD /opt/kcptun/client_linux_arm7 -r $SERVER:$SERVER_PORT -l ":1083" --key $KCP_PASSWORD

