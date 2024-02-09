FROM ruby:3.3.0-alpine
WORKDIR /forknacular
COPY . ./

RUN apk --no-cache update && apk upgrade && \
    apk add --no-cache alpine-sdk && \
    gem update --system && gem install bundler --version 2.5.6

RUN bundle install

CMD ["puma"]
