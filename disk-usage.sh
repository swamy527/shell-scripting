#!/bin/bash

disk_usage=$(df -hT | grep -vE 'tmp|File')
Thresh=1
message=""

while IFS= read line
do
  usage=$(echo $line | awk '{print $6F}' | cut -d % -f1)
  partition=$(echo $line | awk '{print $1F}')
  if [ $usage -ge $Thresh ]
  then
      message+="high disk usage on $partition: $usage\n"
   fi
done <<< $disk_usage

echo -e "$message"
