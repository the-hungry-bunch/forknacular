FROM ruby:3.1.2-alpine
WORKDIR /forknacular
COPY . ./
CMD ["/bin/sh"]
