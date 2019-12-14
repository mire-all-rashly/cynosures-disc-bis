#!/bin/bash --

if [ "run" = "$1" ]; then
  cp /app/opencanary.conf /root/.;
  /usr/local/bin/opencanaryd --dev;
  exit 0;
fi;

exec "$@";
