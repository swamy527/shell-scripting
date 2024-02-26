#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

source=/tmp/log-files

if [ ! -d $source ]
then
    echo -e "$R $source directory not exists $N"
    exit 1
fi

files_delete=$(find $source -type f -mtime +14 -name "*.log")

while IFS= read -r line
do
  echo "deleting file: $line"
  rm -rf $line
done <<< $(files_delete