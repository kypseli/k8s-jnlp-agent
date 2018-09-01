FROM openjdk:8-jre-alpine3.8

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

RUN mkdir -p /usr/share/jenkins  \
  && chmod 755 /usr/share/jenkins \
  && chown jenkins:jenkins /usr/share/jenkins \
  && mkdir -p ${AGENT_WORKDIR} \
  && chown jenkins:jenkins ${AGENT_WORKDIR} \
  && chmod 777 ${AGENT_WORKDIR}

USER ${user}
ENV AGENT_WORKDIR=${AGENT_WORKDIR}
RUN mkdir -p /home/${user}/.jenkins

VOLUME /home/${user}/.jenkins
VOLUME ${AGENT_WORKDIR}
WORKDIR /home/${user}