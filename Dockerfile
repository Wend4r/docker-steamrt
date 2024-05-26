FROM registry.gitlab.steamos.cloud/steamrt/sniper/platform

RUN adduser --disabled-password --gecos "" steam && \
	mkdir -p /home/steam/steamcmd && \
	curl -sSL https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz | tar -zx -C /home/steam/steamcmd && \
	chown -R steam:steam /home/steam

ENV DEBIAN_FRONTEND=noninteractive

CMD [ "/bin/bash" ]
