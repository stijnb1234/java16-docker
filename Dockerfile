FROM        eclipse-temurin:16-jd

LABEL       author="Stijn Bannink" maintainer="stijn.bannink@hostvalues.net"

RUN apt-get update -y \
 && apt-get install -y curl ca-certificates openssl git tar sqlite fontconfig tzdata iproute2 \
 && useradd -d /home/container -m container

USER        container
ENV         USER=container HOME=/home/container

WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]
