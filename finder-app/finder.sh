#!/bin/bash

if [ $# -ne 2 ]; then
	echo "Usage: $0 <directory> <string>"
	exit 1
fi
filedir="$1"
searchstr="$2"

find_str(){
	if [ ! -d ${filedir} ]; then
		echo "Directory does not exist"
		return 1
	fi
        total_files=$(ls ${filedir} | wc -l)
	total_match=$(grep -rwn "${searchstr}" ${filedir} | wc -l)
	echo "The number of files are ${total_files} and the number of matching lines are ${total_match}"
}

find_str
