aws ec2 describe-images \
    --filters "Name=name,Values=*Backup*" \
    --query 'Images[*].[ImageId]' \
    --output text > /tmp/backup_ami_list.txt
echo "Total AMI's tagged with Backup tag = ` wc -l /tmp/backup_ami_list.txt | awk '{print $1}'` "
wc -l /tmp/backup_ami_list.txt | awk '{print $1}'
