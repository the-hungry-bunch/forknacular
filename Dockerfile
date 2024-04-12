FROM ruby:3.3.0-alpine
WORKDIR /forknacular

RUN apk --no-cache update && apk upgrade && \
    apk add --no-cache alpine-sdk && \
    gem update --system && gem install bundler --version 2.5.6

COPY Gemfile Gemfile.lock .ruby-version ./

RUN bundle install

COPY . ./

CMD ["puma"]
