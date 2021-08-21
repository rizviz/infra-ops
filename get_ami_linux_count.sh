#!/bin/bash
# Returns Linux AMI count in own account
 if [ -z "$1" ]
   then
     echo
     echo " Need region id "
     echo " Usage : ./get_ami_win_count.sh <regionId e.g. us-east-1>"
     exit
 fi

aws ec2 describe-images \
    --owners self \
    --filters "Name=root-device-type,Values=ebs" --query 'Images[*].[ImageId]' --output text --region $1  | wc -l
