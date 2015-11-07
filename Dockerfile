# docker build -t telminov/ubuntu-14.04-python3.5 .

FROM ubuntu:14.04
MAINTAINER telminov <telminov@soft-way.biz>

RUN apt-get update && \
    apt-get install -y \
                    wget \
                    xz-utils \
                    build-essential \
                    libsqlite3-dev \
                    libreadline-dev \
                    libssl-dev \
                    openssl
                        
WORKDIR /tmp
RUN wget https://www.python.org/ftp/python/3.5.0/Python-3.5.0.tar.xz
RUN tar -xf Python-3.5.0.tar.xz
WORKDIR /tmp/Python-3.5.0
RUN ./configure
RUN make
RUN make install

WORKDIR /
RUN rm -rf /tmp/Python-3.5.0.tar.xz /tmp/Python-3.5.0

RUN pip3 install ipython
