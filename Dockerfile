FROM alpine:3.14 as downloader
WORKDIR /tmp

RUN  apk update \
  && apk upgrade \
  && apk add --update \
    ca-certificates \
    wget \
  && update-ca-certificates \
  && rm -rf /var/cache/apk/*

ARG PLANTUML_VERSION=1.2022.5
RUN wget "http://sourceforge.net/projects/plantuml/files/plantuml.${PLANTUML_VERSION}.jar/download" -O plantuml.jar


FROM squidfunk/mkdocs-material:latest as runtime

# Let's add Java to the container
RUN apk update \
  && apk upgrade \
  && apk add ca-certificates \
  && update-ca-certificates \
  && apk add --update \
    coreutils \
  && rm -rf /var/cache/apk/*   \ 
  && apk add --update \
    openjdk11 \
    tzdata \
    curl \
    unzip \
    graphviz \
    ttf-dejavu \
  && apk add --no-cache \
    nss \
  && rm -rf /var/cache/apk/*

RUN pip3 install --no-cache-dir \
      plantuml-markdown

COPY --from=downloader /tmp/plantuml.jar /opt/plantuml.jar
COPY ./bin/plantuml /usr/bin/plantuml 
RUN chmod +x /usr/bin/plantuml

WORKDIR /docs
