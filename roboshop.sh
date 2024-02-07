#!/bin/bash

AMI=ami-0f3c7d07486cad139
SG_ID=sg-01a6080de1a905872 #replace with your SG ID
INSTANCES=("mongodb" "redis" "mysql" "rabbitmq" "catalogue" "user" "cart" "shipping" "payment" "dispatch" "web")



for i in "${INSTANCES[@]}"
do
     echo "instance is: $i"
    if [ $i == "mongodb" ] || [ $i == "mysql" ] || [ $i == "shipping" ]
    then
        INSTANCE_TYPE="t3.small"
    else
        INSTANCE_TYPE="t2.micro"
    fi
    aws ec2 run-instances --image-id ami-0f3c7d07486cad139 --instance-type t2.micro  --security-group-ids sg-01a6080de1a905872 --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$i}]" --query 'Instances[0].PrivateIpAddress' --output text
    done 

  