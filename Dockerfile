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

WORKDIR /kittens
COPY . /kittens/

#RUN bundle install

# Add a script to be executed every time the container starts.
#COPY entrypoint.sh /usr/bin/
#RUN chmod +x /usr/bin/entrypoint.sh
#ENTRYPOINT ["entrypoint.sh"]
#EXPOSE 3000

# Configure the main process to run when running the image
CMD ["s", "-b", "0.0.0.0"]