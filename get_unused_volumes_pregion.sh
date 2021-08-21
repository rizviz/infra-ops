#!/bin/bash
echo "Get all unattached volumes for current account "
echo "Note: This will return ununsed vols per region in separate files"
export TIMESTAMP="`date +"%d-%m-%Y"`"

for REGION in $(aws ec2 describe-regions --output text --query 'Regions[].[RegionName]') ; 
do 
    echo $REGION && aws ec2 describe-volumes --filter "Name=status,Values=available" --query 'Volumes[*].{VolumeID:VolumeId,Size:Size,Type:VolumeType,AvailabilityZone:AvailabilityZone}' --region $REGION | grep VolumeID > /tmp/unattached-volumes-$REGION.txt
    echo " Massaging data for volume list : taking out spaces, qoutes and other chars from output"
    sed "s/^[ \t]*//" /tmp/unattached-volumes-$REGION.txt | awk '{print $2}' | sed "s/\"//" | sed "s/\",//" > /tmp/unattached-volumes-$REGION-v2.txt
    sort /tmp/unattached-volumes-$REGION-v2.txt > $PWD/unused-vols-$REGION-$TIMESTAMP.txt;

done 

