#!/bin/bash --

if [ "run" = "$1" ]; then
  bash;
  exit 0;
fi;

exec "$@";
