FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive
RUN mkdir -p /usr/share/doc/fahclient/ && touch /usr/share/doc/fahclient/sample-config.xml


RUN apt-get update && apt-get install -y wget vim-nox && \
  wget https://download.foldingathome.org/releases/public/release/fahclient/debian-testing-64bit/v7.4/fahclient_7.4.4_amd64.deb && \
  wget https://download.foldingathome.org/releases/public/release/fahcontrol/debian-testing-64bit/v7.4/fahcontrol_7.4.4-1_all.deb && \
  wget https://download.foldingathome.org/releases/public/release/fahviewer/debian-testing-64bit/v7.4/fahviewer_7.4.4_amd64.deb && \
  dpkg -i --force-depends fahclient_7.4.4_amd64.deb && \
  dpkg -i --force-depends fahcontrol_7.4.4-1_all.deb && \
  dpkg -i --force-depends fahviewer_7.4.4_amd64.deb && \
  rm -rf /var/lib/apt/lists/* 

ADD ./config.xml /etc/fahclient/config.xml
CMD ["FAHClient", "--config", "/etc/fahclient/config.xml"]
# CMD ["FAHClient", "--help"]