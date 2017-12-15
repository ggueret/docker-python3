FROM debian:stretch

ENV LANG "C"
ENV DEBIAN_FRONTEND "noninteractive"

RUN apt-get update && apt-get install -y ca-certificates curl python3 && rm -rf /var/lib/apt/lists/*
RUN ln -s /usr/bin/python3 /usr/local/bin/python
RUN curl -s https://bootstrap.pypa.io/get-pip.py | python

ADD requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt

RUN echo "python version: `python --version`"
RUN echo "pip version: `pip --version`"

WORKDIR /usr/src/scripts
