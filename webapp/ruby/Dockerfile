FROM ruby:2.7

RUN mkdir /app
WORKDIR /app

RUN apt-get update && apt-get install mariadb-client

COPY Gemfile Gemfile.lock /app/
RUN bundle install
