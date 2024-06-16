FROM ubuntu:22.04

ENV C2_PLUGINDIR=/usr/local/plugins

ENV C2_LIBDIR=/usr/local/lib

RUN apt-get update && \
    apt-get install -y git make gcc && \
    mkdir -p /opt /usr/local/lib /usr/local/plugins && \
    cd /usr/local && \
    git clone https://github.com/c2lang/c2_libs lib && \
    cd lib && \
    rm -rf .git && \
    cd /opt && \
    git clone https://github.com/c2lang/c2c_native && \
    cd c2c_native && \
    make -C bootstrap && \
    ./install_plugins.sh && \
    cp -p output/c2c/c2c output/c2tags/c2tags /usr/local/bin/

WORKDIR /code

COPY bin .

CMD "./run.sh"