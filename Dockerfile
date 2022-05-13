FROM ruby:3.1.2-alpine
WORKDIR /forknacular
COPY . ./

RUN apk --no-cache update && apk upgrade && \
    apk add --no-cache alpine-sdk && \
    gem update --system && gem install bundler

RUN bundle install

CMD ["puma"]
