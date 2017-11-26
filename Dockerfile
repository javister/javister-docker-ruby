FROM javister-docker-docker.bintray.io/javister/javister-docker-base:1.0
MAINTAINER Viktor Verbitsky <vektory79@gmail.com>

ARG DATE

LABEL \
    ruby.version=2 \
    image.date="${DATE}"

COPY files /

ENV BASE_RPMLIST="$BASE_RPMLIST ruby.x86_64" \
    BUILD_RPMLIST="$BUILD_RPMLIST ruby-devel.x86_64 make.x86_64 gcc.x86_64 glibc-devel.x86_64"

RUN . /usr/local/bin/yum-proxy && \
    yum-install && \
    echo '*** Clean up yum caches' && \
    yum-clean && \
    chmod --recursive +x /etc/my_init.d/*.sh /etc/service /usr/local/bin/*
