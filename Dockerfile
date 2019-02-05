FROM maven:3.3.9-jdk-8-alpine

RUN apk add --no-cache \
             wget \
             bash \
             git \
             procps

ARG user=jenkins
ARG group=jenkins
ARG uid=10000
ARG gid=10000

ENV HOME /home/${user}
RUN addgroup -g ${gid} ${group}
RUN adduser -h $HOME -u ${uid} -G ${group} -D ${user}

ARG AGENT_WORKDIR=/home/${user}/agent
ENV AGENT_WORKDIR=${AGENT_WORKDIR}

USER ${uid}
RUN mkdir -p /home/${user}/.jenkins && mkdir -p ${AGENT_WORKDIR}

WORKDIR /home/${user}
