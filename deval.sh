#!/bin/sh

show_usage_deval() {
	cat <<"EOF"
deval - decrypt eval encrypted shell script
  usage: sudo [-l] file1 file2

    Options:
      -l          Penetrate double layer obfuscation
EOF
}

if [[ "$1" == "-l" ]]; then
	DOUBLE_LAYER=true
	shift
fi

if [ -z "$@" ]; then
	show_usage_deval
	exit 0
fi

for arg in $@; do
	if [ -f $arg ]; then
		filename="${arg%.*}"
		echo "Decrypting $arg → $filename.dec.sh"
		if [ -z $DOUBLE_LAYER ]; then
			cat $arg | sed 's/eval/echo/g' | sh >$filename.dec.sh
		else
			cat $arg | sed 's/eval/echo/g' | sh | sh >$filename.dec.sh
		fi
	else
		echo "script "$arg" do not exist"
	fi
done
