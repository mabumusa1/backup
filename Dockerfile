ARG OS_IMAGE=alpine:3.14

FROM $OS_IMAGE AS base


RUN apk update
RUN apk upgrade
RUN apk add --no-cache --upgrade bash
RUN apk add --no-cache --upgrade redis 

RUN mkdir -p /home/docker/app

RUN addgroup -S docker
RUN adduser -S docker -G docker --disabled-password --home "/home/docker/app" --no-create-home
RUN chown docker:docker /home/docker/app
WORKDIR /home/docker/app
COPY backup.sh ./backup.sh
RUN chown docker:docker ./backup.sh
RUN chmod u+x ./backup.sh

FROM base AS dependencies
USER docker
CMD ["bin/bash", "/backup.sh"]