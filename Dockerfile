FROM ubuntu:latest

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC
RUN apt-get update && apt-get install -y tzdata

RUN apt-get install -y \
    bison \
    build-essential \
    byacc \
    file \
    flex \
    gawk \
    gcc-arm-none-eabi \
    git \
    groff-base \
    help2man \
    libelf-dev \
    libfuse-dev \
    libncurses-dev \
    libtool-bin \
    make \
    mandoc \
    nvi \
    pkg-config \ 
    sudo \
    texinfo \
    unzip \
    wget

RUN echo "wheel:x:0:" >> /etc/group

RUN wget http://crosstool-ng.org/download/crosstool-ng/crosstool-ng-1.25.0.tar.xz
RUN tar xf crosstool-ng-1.25.0.tar.xz
RUN cd crosstool-ng-1.25.0 && ./configure && make && make install

RUN mkdir ~/mips
COPY ct.config /root/mips/.config
RUN cd ~/mips && ct-ng build

