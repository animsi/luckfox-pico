FROM amd64/ubuntu:22.04
LABEL maintainer="Homalozoa <haiwang.animsi.com>"

# Replace mirror to Tsinghua
RUN sed -i 's/archive.ubuntu.com/mirrors.tuna.tsinghua.edu.cn/g' /etc/apt/sources.list

# Install dependencies
RUN apt-get -y update
RUN apt-get install -q -y --no-install-recommends ca-certificates

# setup timezone
RUN echo 'Etc/UTC' > /etc/timezone && \
  ln -s /usr/share/zoneinfo/Etc/UTC /etc/localtime && \
  apt-get update && \
  apt-get install -q -y --no-install-recommends tzdata

# Install basic tools
RUN apt-get -q -y install git ssh make gcc gcc-multilib g++-multilib \
    module-assistant expect g++ gawk texinfo libssl-dev bison flex \
    fakeroot cmake unzip gperf autoconf device-tree-compiler \
    libncurses5-dev pkg-config bc python-is-python3 passwd openssl \
    openssh-server openssh-client vim file cpio rsync
RUN apt-get -q -y install curl libtool libtool-bin patchelf
