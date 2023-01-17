FROM ruby
WORKDIR /app
COPY . /app
RUN bundle install
RUN bundle exec jekyll build