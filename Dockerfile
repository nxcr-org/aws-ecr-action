FROM docker:20.10.8

RUN apk update \
  && apk upgrade \
  && apk add --no-cache --update python3 py3-pip coreutils bash git curl \
  && rm -rf /var/cache/apk/* \
  && pip3 install pyyaml==5.3.1 \
  && pip3 install -U awscli \
  && apk --purge -v del py-pip

ADD entrypoint.sh /entrypoint.sh

RUN ["chmod", "+x", "/entrypoint.sh"]

ENTRYPOINT ["/entrypoint.sh"]
