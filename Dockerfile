FROM ubuntu

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC
RUN apt-get update && apt-get install -y tzdata

RUN apt-get install -y \
    bison \
    build-essential \
    byacc \
    flex \
    gawk \
    gcc-arm-none-eabi \
    git \
    groff-base \
    kconfig-frontends \
    libelf-dev \
    libfuse-dev \
    make \
    mandoc \
    nvi \
    pkg-config \ 
    sudo

RUN echo "wheel:x:0:" >> /etc/group
