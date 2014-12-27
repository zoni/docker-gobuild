FROM ubuntu:14.10
MAINTAINER Nick Groenen

ENV GOVERSION 1.4
ENV GOPATH /go
ENV PATH /go/bin:/usr/src/go/bin:$PATH

# http://golang.org/doc/install/source#environment
ENV GOLANG_PLATFORMS \
    darwin/386 darwin/amd64 \
    dragonfly/386 dragonfly/amd64 \
    freebsd/386 freebsd/amd64 freebsd/arm \
    linux/386 linux/amd64 linux/arm \
    nacl/386 nacl/amd64p32 \
    netbsd/386 netbsd/amd64 netbsd/arm \
    openbsd/386 openbsd/amd64 \
    plan9/386 plan9/amd64 \
    solaris/amd64 \
    windows/386 windows/amd64

COPY bin/per-go-platform.sh /usr/local/bin/per-go-platform

COPY bin/build/stage1.sh /build1.sh
RUN /build1.sh && rm /build1.sh
COPY bin/build/stage2.sh /build2.sh
RUN /build2.sh && rm /build2.sh

WORKDIR /go
