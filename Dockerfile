ARG IMAGE_BASE=dind
ARG IMAGE_USER=root
FROM docker:${IMAGE_BASE}

USER root

RUN apk update && apk add openjdk8 
# from https://github.com/tclift/google-cloud-tasks-pull-to-push/blob/master/Dockerfile
# gogradle supplied Go version compiled against glibc - fake it with musl
RUN mkdir /lib64 && ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2

ENTRYPOINT ["dockerd-entrypoint.sh"]
CMD []

USER ${IMAGE_USER}
