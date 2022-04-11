FROM debian:latest
RUN apt-get update && apt-get -y upgrade && \
    DEBIAN_FRONTEND=noninteractive apt-get -y --no-install-recommends install \
    nano gzip wget

RUN mkdir /config
ARG VERSION
RUN wget --no-check-certificate https://github.com/vsimakhin/web-logbook/releases/download/v$VERSION/web-logbook-linux-amd64.tar.gz 
RUN tar -xf web-logbook-linux-amd64.tar.gz 

#add and make startup script +x 
COPY startup.sh /startup.sh
RUN chmod +x /startup.sh

# expose port and run! 
EXPOSE 4000
CMD ["/startup.sh"]

# BUILD: docker build --build-arg VERSION=1.13.0 -t web-logbook .

# RUN: docker run -d -p 4000:4000 --name=web-logbook web-logbook