#!/bin/bash

file=/etc/passwd

if [ ! -f $file]
then
    echo -e "$file not exists"
fi

while IFS=":" read -r username password
do
  echo -e " user name is : $username"
  echo -e "password is : $password"
done < $file
