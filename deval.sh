#!/bin/sh

for arg in $@; do
	cat $arg | sed 's/eval/echo/g' | sh | sh >$arg.dec.sh
done
