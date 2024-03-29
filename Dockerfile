FROM ruby:3.1.2-alpine
WORKDIR /forknacular
COPY . ./

RUN apk --no-cache update && apk upgrade && \
    apk add --no-cache alpine-sdk && \
    gem update --system && gem install bundler --version 2.3.13

RUN bundle install

CMD ["puma"]
