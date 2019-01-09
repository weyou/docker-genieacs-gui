#!/bin/sh

if [ -f /app/tmp/pids/server.pid ]; then 
    rm /app/tmp/pids/server.pid
fi

cd /app
exec rails s

