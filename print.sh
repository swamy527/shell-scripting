#!/bin/bash

file=/etc/passwd

if [ ! -f $file ]
then
    echo -e "$file not exists"
fi

while IFS=":" read -r username password userid groupid
do
  echo -e " user name is : $username"
  echo -e "password is : $password"
  echo -e "user id : $userid"
done < $file
