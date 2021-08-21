aws ec2 describe-images \
    --filters "Name=name,Values=*Backup*" \
    --query 'Images[*].[ImageId]' \
    --output text
