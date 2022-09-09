FROM ruby:2.7.4

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

ENV APP_PATH=/app

WORKDIR $APP_PATH

COPY Gemfile Gemfile.lock ./

RUN bundle install

# Copy the main application.
COPY . ./

EXPOSE 3000

# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]