#!/bin/bash
aws s3api list-buckets --output text > ~/tmp/bkts
cat ~/tmp/bkts | awk '{print $3}' | grep jaehoo  > ~/tmp/jhbkts
while read line;
do
  aws s3 rm s3://$line --recursive ; aws s3api delete-bucket --bucket $line &
  done < ~/tmp/jhbkts
