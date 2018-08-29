FROM openjdk:8-jre-alpine3.8

RUN apk add --no-cache wget bash git openssh-client openssl procps

ARG user=jenkins
ARG group=jenkins
ARG uid=10000
ARG gid=10000

ENV HOME /home/${user}
RUN addgroup -g ${gid} ${group}
RUN adduser -h $HOME -u ${uid} -G ${group} -D ${user}
LABEL Description="This is a base image, which allows connecting Jenkins agents via JNLP protocols" Vendor="Kypseli" Version="8"

ARG AGENT_WORKDIR=/home/${user}/agent

USER ${user}
ENV AGENT_WORKDIR=${AGENT_WORKDIR}
RUN mkdir /home/${user}/.jenkins && mkdir -p ${AGENT_WORKDIR}

VOLUME /home/${user}/.jenkins
VOLUME ${AGENT_WORKDIR}
WORKDIR /home/${user}
