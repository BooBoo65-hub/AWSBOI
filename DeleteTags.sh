ServiceID="*"


#getting instance ids

# for i in $(aws ec2 describe-instances  --filter  Name=tag-value,Values=$ServiceID --query 'Reservations[*].Instances[*].InstanceId' --output text); do
for i in $(aws ec2 describe-instances  --filter  Name=tag-value,Values=$ServiceID --query 'Reservations[*].Instances[*].InstanceId' --output text); do
# getting tag values based on key values


iBlockdisk=$(aws ec2 describe-instances --instance-id $i --query 'Reservations[].Instances[].[Tags[?Key==`BlockDevice`].Value | [0]]' --output text)

#getting volume ids attached to the instances
   for j in $(aws ec2 describe-volumes --filters Name=attachment.instance-id,Values=$i --query 'Volumes[*].{ID:VolumeId}' --output text); do
# checking there tag values
 
   vBlockdisk=$(aws ec2 describe-volumes --volume-id $j --query 'Volumes[].[Tags[?Key==`BlcokDevice`].Value | [0]]' --output text)


# if there are no tag values assign instance tag values to  the volumes


              aws ec2 delete-tags --resources $j --tags Key=BlcokDevice,Value=`echo $iBlockdisk`
   done
done