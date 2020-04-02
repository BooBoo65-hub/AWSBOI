ServiceID=9999
Environment=Virtual

#getting instance ids

for i in $(aws ec2 describe-instances  --filter  Name=tag-value,Values=$ServiceID Name=tag-value,Values=$Environment --query 'Reservations[*].Instances[*].InstanceId' --output text); do
# getting tag values based on key values
iName=$(aws ec2 describe-instances --instance-id $i --query 'Reservations[].Instances[].[Tags[?Key==`Name`].Value | [0]]' --output text)
iServiceid=$(aws ec2 describe-instances --instance-id $i --query 'Reservations[].Instances[].[Tags[?Key==`Service ID`].Value | [0]]' --output text)
iEnvironment=$(aws ec2 describe-instances --instance-id $i --query 'Reservations[].Instances[].[Tags[?Key==`Environment`].Value | [0]]' --output text)

#getting volume ids attached to the instances
   for j in $(aws ec2 describe-volumes --filters Name=attachment.instance-id,Values=$i --query 'Volumes[*].{ID:VolumeId}' --output text); do
# checking there tag values
   vName=$(aws ec2 describe-volumes --volume-id $j --query 'Volumes[].[Tags[?Key==`Name`].Value | [0]]' --output text)
   vServiceid=$(aws ec2 describe-volumes --volume-id $j --query 'Volumes[].[Tags[?Key==`Service ID`].Value | [0]]' --output text)
   vEnvironment=$(aws ec2 describe-volumes --volume-id $j --query 'Volumes[].[Tags[?Key==`Environment`].Value | [0]]' --output text)

# if there are tag values delete values to the volumes

          if [ "$iName" == "Name" ] && [ "$vName" == "Name" ]; then
              aws ec2 delete-tags --resources $j --tags Key=Name
          fi

          if [ "$iServiceid" == "Service ID" ] && [ "$vServiceid" == "Service ID" ]; then
              aws ec2 delete-tags --resources $j --tags Key="Service ID"
          fi

          if [ "$iEnvironment" == "Environment" ] && [ "$vEnvironment" == "Environment" ]; then
              aws ec2 delete-tags --resources $j --tags Key=Environment
          fi
   done
done