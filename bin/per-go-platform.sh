#!/bin/bash

set -e

for platform in $GOLANG_PLATFORMS
do
	export GOOS=${platform%/*}
	export GOARCH=${platform##*/}
	if [[ $GOARCH == "arm" ]]
	then
		for goarm in {5..7}
		do
			export GOARM=$goarm
			eval $@
			unset GOARM
		done
	else
		eval $@
	fi
done
