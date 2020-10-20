FROM ruby:2.6.6

RUN apt-get update -qq && \
apt-get install -y build-essential \
libpq-dev \
nodejs

RUN mkdir /Music-record
ENV APP_ROOT //Music-record
WORKDIR $APP_ROOT

ADD ./Gemfile $APP_ROOT/Gemfile
ADD ./Gemfile.lock $APP_ROOT/Gemfile.lock
RUN bundle install
ADD . $APP_ROOT
