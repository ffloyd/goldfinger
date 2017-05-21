FROM ruby:2.4.1-alpine

ENV RAILS_LOG_TO_STDOUT=true SECRET_KEY_BASE=woot666 RAILS_ENV=production

RUN apk add --no-cache build-base sqlite-dev nodejs tzdata

WORKDIR /app
COPY Gemfile* /app/
RUN bundle install

COPY . /app
RUN rails db:setup

CMD ["./run.sh"]