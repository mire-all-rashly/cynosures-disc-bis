FROM debian:testing

ARG START_POINT=/app

RUN  apt update \
  && apt install -y \
      ftp git lynx mycli nmap ncat openssh-client tftp \
  && rm -rf /var/lib/apt/lists/*

COPY data $START_POINT
WORKDIR $START_POINT

ENTRYPOINT ["/bin/sh", "/app/run.sh"]
CMD ["run"]
