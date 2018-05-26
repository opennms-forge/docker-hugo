FROM ruby:2.5-alpine

LABEL maintainer "Ronny Trommer <ronny@opennms.org>"

ARG HUGO_VERSION=0.41
ARG HUGO_DOWNLOAD_URL=https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz

RUN apk add --no-cache curl && \
    cd /usr/local/bin && \
    curl -L ${HUGO_DOWNLOAD_URL} | tar xz && \
    gem install asciidoctor && \
    mkdir -p /opt/repo

WORKDIR /opt/repo

VOLUME [ "/opt/repo" ]

CMD [ "/usr/local/bin/hugo", "--help" ]

EXPOSE 1313
