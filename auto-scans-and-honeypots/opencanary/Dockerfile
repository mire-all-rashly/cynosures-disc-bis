FROM debian:testing-slim

ARG START_POINT=/app

RUN \
  apt update \
  && \
  apt install -y \
    python-dev python-pip \
    libpcap-dev \
    build-essential libssl-dev libffi-dev python-dev \
    sudo \
  && \
  pip install opencanary scapy pcapy rdpy

COPY data $START_POINT
WORKDIR $START_POINT

ENTRYPOINT ["/bin/sh", "/app/run.sh"]
CMD ["run"]
