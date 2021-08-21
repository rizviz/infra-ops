#!/bin/bash

if [ -z "$1" ]
   then
     echo
     echo " No volume ids file name provided "
     echo " Usage : ./clean_unused_vols.sh [unattached_vols_list.txt]"
     exit
 fi
echo

while IFS= read -r volid; do
  printf '%s\n' "Deleting $volid"
  aws ec2 delete-volume --volume-id $volid
done < $1

