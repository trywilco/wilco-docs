FROM ruby:3.1
WORKDIR /app
COPY . /app
RUN bundle install
RUN bundle exec jekyll build