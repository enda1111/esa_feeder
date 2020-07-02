#!/bin/sh

APP_PORT=5000
if [ -n "$PORT" ]; then
  APP_PORT=$PORT
fi

bundle exec ruby sinatra/app.rb -p $APP_PORT -o 0.0.0.0
