FROM docker:dind

RUN apk update && apk add openjdk8

ENTRYPOINT ["dockerd-entrypoint.sh"]
CMD []