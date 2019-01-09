#!/bin/sh

if [ -f /app/tmp/pids/server.pid ]; then 
    rm /app/tmp/pids/server.pid
fi

if [ -z "$*" ]; then
    exec rails s
else
    exec "$@"
fi
