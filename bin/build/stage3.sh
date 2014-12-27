#!/bin/bash

set -e
set -x

mkdir /tmp/github-release
curl --silent --show-error --location \
	https://github.com/aktau/github-release/releases/download/${GITHUB_RELEASE_VERSION}/linux-amd64-github-release.tar.bz2 \
| tar --verbose --directory /tmp/github-release --extract --bzip2
mv /tmp/github-release/bin/linux/amd64/github-release /usr/local/bin
rm --recursive /tmp/github-release
