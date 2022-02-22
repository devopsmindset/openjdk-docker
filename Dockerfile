ARG IMAGE_BASE=dind
ARG IMAGE_USER=root
ARG JAVA=8
FROM docker:${IMAGE_BASE}

USER root
ENV JAVA_PKG=openjdk${JAVA}

# from https://github.com/tclift/google-cloud-tasks-pull-to-push/blob/master/Dockerfile
# gogradle supplied Go version compiled against glibc - fake it with musl
RUN /bin/bash -c 'apk update && apk add --no-cache $JAVA_PKG && apk add --no-cache git \
  && mkdir /lib64 && ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2'

RUN apk add wget && wget -O /tmp/install4j_unix_8_0_8.tar.gz https://download-gcdn.ej-technologies.com/install4j/install4j_unix_8_0_8.tar.gz \
   && tar -zxvf /tmp/install4j_unix_8_0_8.tar.gz && mv install4j8.0.8/ /tmp/install4j

ENTRYPOINT ["dockerd-entrypoint.sh"]
CMD []

USER ${IMAGE_USER}
