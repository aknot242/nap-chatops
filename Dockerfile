FROM fluent/fluentd:v1.11.5-1.0

USER root

RUN apk add --no-cache --update --virtual .build-deps \
        sudo build-base ruby-dev \
 # cutomize following instruction as you wish
 && sudo gem install fluent-plugin-elasticsearch \
 && sudo gem install fluent-plugin-slack \
 && sudo gem install fluent-plugin-teams \
 && sudo gem sources --clear-all \
 && apk del .build-deps \
 && rm -rf /home/fluent/.gem/ruby/2.5.0/cache/*.gem

COPY fluent.conf /fluentd/etc/
COPY entrypoint.sh /bin/

USER fluent
