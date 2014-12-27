#!/bin/bash

set -e
set -x
export DEBIAN_FRONTEND=noninteractive
aptinstall="apt-get install --no-install-recommends --yes"

apt-get update
$aptinstall language-pack-en build-essential ca-certificates git mercurial bzr curl
echo LC_ALL="en_US.utf8" >> /etc/environment

rm --recursive --force /var/lib/apt/lists/*
