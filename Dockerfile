FROM ubuntu:14.04
MAINTAINER Juan Berner <89berner@gmail.com>

ENV TERM linux
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

# Update before installing any package
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get dist-upgrade -y

RUN apt-get install -y openssh-server && apt-get install -y curl

RUN chmod 600 /root/.ssh/id_rsa

RUN /usr/sbin/useradd 89berner -s /bin/bash
