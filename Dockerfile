FROM ruby:2.4.9-alpine

RUN apk add --update --virtual \
runtime-deps \
build-base \
libxml2-dev \
libxslt-dev \
libc-dev \
postgresql-client \
postgresql-dev \
bash \
&& rm -rf /var/cache/apk/*

WORKDIR /app
COPY . .
RUN chmod +x ./entrypoint.sh
RUN bundle install
EXPOSE 3000
ENTRYPOINT ["bundle", "exec"]