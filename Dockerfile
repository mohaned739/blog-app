FROM ruby:2.6.7
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev
WORKDIR /blog-app
RUN gem install bundler:2.2.20
COPY Gemfile /blog-app/Gemfile
COPY Gemfile.lock /blog-app/Gemfile.lock
RUN bundle install
COPY .. /blog-app
CMD ["rails", "server", "-b", "0.0.0.0"]