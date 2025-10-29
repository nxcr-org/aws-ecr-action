FROM docker:20.10.8

RUN apk update \
  && apk upgrade \
  && apk add --no-cache --update python3 py3-pip coreutils bash git \
  && python3 -m venv /venv \
  && . /venv/bin/activate \
  && pip install --upgrade pip \
  && pip install pyyaml==5.3.1 awscli \
  && deactivate \
  && apk --purge -v del py-pip

ADD entrypoint.sh /entrypoint.sh

RUN ["chmod", "+x", "/entrypoint.sh"]

ENTRYPOINT ["/entrypoint.sh"]
