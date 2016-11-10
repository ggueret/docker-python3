FROM debian:jessie

ENV LANG "C"
ENV DEBIAN_FRONTEND "noninteractive"

RUN echo 'deb http://ftp.debian.org/debian jessie main\n\
deb http://ftp.debian.org/debian jessie-updates main\n\
deb http://security.debian.org jessie/updates main\n'\
> /etc/apt/sources.list

RUN apt-get update && apt-get install -y ca-certificates curl python3 && rm -rf /var/lib/apt/lists/*
RUN ln -s /usr/bin/python3 /usr/local/bin/python

RUN curl -s https://bootstrap.pypa.io/get-pip.py | python

ADD requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt

RUN echo "python version: `python3 --version`"
RUN echo "pip version: `pip --version`"

WORKDIR /data