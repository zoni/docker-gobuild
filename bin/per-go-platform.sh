#!/bin/bash

set -e

for platform in $GOLANG_PLATFORMS
do
	export GOOS=${platform%/*}
	export GOARCH=${platform##*/}
	eval $@
done
