aws ec2 describe-tags --filters Name=key,Values=Stack

aws ec2 describe-tags --filters Name=value,Values=BooBoo-Test-1

aws ec2 describe-tags --filters Name=key,Values=Stack Name=value,Values=BooBoo-Test-1

aws ec2 describe-tags --filters Name=value,Values=BooBoo-SG

aws ec2 describe-tags --filters Name=key,Values=Stack

aws ec2 describe-tags --filters Name=value,Values=BooDemoInstance

aws ec2 describe-tags --filters Name=value,Values=BooBoo-SG

aws ec2 describe-tags --filters Name=value,Values=BooBoo-GW

aws ec2 describe-tags --filters Name=key,Values=Gateway Name=value,Values=BooBoo-GW

aws ec2 describe-tags --filters Name=key,Values=Stack Name=value,Values=BooBoo-Test-1

aws ec2 describe-tags --filters "Name=resource-type,Values=volume"

aws ec2 describe-tags --filters "Name=resource-type,Values=instance"

aws ec2 describe-tags --filters Name=key,Values=RouteTBB

aws ec2 describe-tags --filters Name=key,Values=RouteTBB Name=value,Values=RouteTableBooBoo

aws ec2 create-tags --resources ami-0aaada7cbb0d829fc --tags Key=Stack,Value=BooBoo-Demo