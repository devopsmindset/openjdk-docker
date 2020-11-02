ARG IMAGE_BASE=dind
ARG IMAGE_USER=root
FROM docker:${IMAGE_BASE}
USER root

RUN apk update && apk add openjdk8

ENTRYPOINT ["dockerd-entrypoint.sh"]
CMD []

USER ${IMAGE_USER}