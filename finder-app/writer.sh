#!/bin/bash

if [ $# -ne 2 ]; then
	echo "Usage: $0 <file path> <string>"
	exit 1
fi
writefile="$1"
writestr="$2"

write_file(){
	dir=$(dirname $writefile)
	if [ ! -d $dir ]; then
		mkdir -p $dir
	fi 
	echo "$writestr" > $writefile

}

write_file
