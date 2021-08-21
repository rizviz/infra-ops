#!/bin/bash
echo "Get all unattached volumes for current account "
echo "Warning: This will return ALL ununsed vols in ALL regions"
export TIMESTAMP="`date +"%d-%m-%Y"`"

for REGION in $(aws ec2 describe-regions --output text --query 'Regions[].[RegionName]') ; do echo $REGION && aws ec2 describe-volumes --filter "Name=status,Values=available" --query 'Volumes[*].{VolumeID:VolumeId,Size:Size,Type:VolumeType,AvailabilityZone:AvailabilityZone}' --region $REGION; done | grep VolumeID > /tmp/unattached-volumes.txt

echo " Massaging data for volume list : taking out spaces, qoutes and other chars from output"
sed "s/^[ \t]*//" /tmp/unattached-volumes.txt | awk '{print $2}' | sed "s/\"//" | sed "s/\",//" > /tmp/unattached-volumes-v2.txt

sort /tmp/unattached-volumes-v2.txt > $PWD/unattached-volumes-$TIMESTAMP.txt
