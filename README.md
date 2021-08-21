# Description

AWS cli slicing and dicing to get valuable operational info such as unused volumes, AMI's , account specific info etc. More to be added soon. Quick n dirty

## Pre-Requisites

 1. Ensure that you have an IAM account setup with API Access credentials
 2. Have setup config and credentials in "~/.aws/" directory

## References

- [AWS] CLI Filtering guide :
- <https://docs.aws.amazon.com/cli/latest/userguide/cli-usage-filter.html>

- Find specific Linux AMI's :
- <https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/finding-an-ami.html>

## Pre Req Config Examples

#### Sample config file "~/.aws/config"

[default]
region = us-west-1
output = json

#### Sample credentials file " ~/.aws/credentials"

[default]
aws_access_key_id = AXXXXUUUUSOWOWOWOO
aws_secret_access_key = z1K4.....se2   <-- from IAM console

#### Author

- Zeeshan Rizvi / @zeerizvi

#### License

- MIT License
# Readme for infra-ops repo
