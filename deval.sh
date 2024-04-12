#!/bin/sh
# deval is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# deval is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with deval.  If not, see <https://www.gnu.org/licenses/>.
#
# Copyright (C) 2024-2025 Rem01Gaming

show_usage_deval() {
	cat <<"EOF"
deval - decrypt eval encrypted shell script
  usage: ./deval.sh [-l] obfuscated1.sh obfuscated2.sh

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
