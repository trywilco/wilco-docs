FROM ruby:3.1 AS base
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install

FROM base AS dev
CMD ["jekyll", "serve", "--host", "0.0.0.0", "--livereload", "--livereload-port", "35729"]

FROM base AS build
COPY . /app
RUN bundle exec jekyll build