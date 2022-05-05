FROM ruby:3.1.2
# alpine fails on installing rails because of websocket-driver

# LABEL Name=downloadstats Version=0.0.1


RUN apt-get update -qq && apt-get install -y nodejs sqlite3

# RUN apk update && apk add -v nodejs sqlite yarn make gcc
RUN gem --version
# RUN gem update --system 3.3.11
# RUN gem install websocket-driver -V
RUN gem install rails -V

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

WORKDIR /app
COPY . /app

# COPY Gemfile Gemfile.lock .
# COPY . ./
RUN bundle install

EXPOSE 3000

CMD rails s -b 0.0.0.0
