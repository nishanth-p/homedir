#! /bin/bash

if [ -z "$1" ]; then
	echo "Filelist not provided as arg1"
	exit 1
fi

if [ -z "$2" ]; then
	echo "Backup directory not provided as arg2"
	exit 1
fi

filelist=$1
backup=$2

old_IFS=$IFS
IFS=$'\n'
for line in $(cat $filelist)
do
	# echo -e "\n$line"
	dir=`dirname $line`
	# echo $backup/$dir
	mkdir -p $backup/$dir
	cp $line $backup/$dir
done
