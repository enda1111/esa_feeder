FROM ruby:2.6.3-alpine3.10

RUN apk update && apk add g++ git make
ENV RACK_ENV production

RUN mkdir /app
WORKDIR /app

RUN bundle config set without 'development test'
COPY Gemfile Gemfile.lock .ruby-version esa_feeder.gemspec /app/
RUN mkdir -p /app/lib/esa_feeder
COPY lib/esa_feeder/version.rb /app/lib/esa_feeder/

RUN bundle install -j 8
COPY ./ /app

CMD ["scripts/start.sh"]
