#!/bin/bash

set -e
set -x

test -e $GOPATH || mkdir $GOPATH

curl --silent --show-error --location http://golang.org/dl/go${GOVERSION}.src.tar.gz \
	| tar --verbose --directory /usr/src --extract --gunzip

cd /usr/src/go/src
per-go-platform ./make.bash --no-clean
