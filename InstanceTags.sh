awslookup() {
  cmd="aws --profile $1 ec2 describe-instances --filters \"Name=tag:Name,Values=$2\" --query 'Reservations[].Instances[].[InstanceId,PublicDnsName,PrivateIpAddress,State.Name,InstanceType,join(\`,\`,Tags[?Key==\`Name\`].Value)]' --output ${3:-table}"
  if [ $# -eq 4 ]
  then
    echo "Running $cmd"
  fi
  eval $cmd
}