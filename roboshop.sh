#!/bin/bash

AMI=ami-0b4f379183e5706b9 #this keeps on changing
SG_ID=sg-034ef8f5fd18dd359 #replace with your SG ID
INSTANCES=("mongodb" "redis" "mysql" "rabbitmq" "catalogue" "user" "cart" "shipping" "payment" "dispatch" "web")


for i in "${INSTANCES[@]}"
do
     echo "insatnce is: $i"
    if [ $i == "mongodb" ] || [ $i == "mysql" ] || [ $i == "shipping" ]
    then
        INSTANCE_TYPE="t3.small"
    else
        INSTANCE_TYPE="t2.micro"
    fi

    aws ec2 run-instances --image-id ami-0b4f379183e5706b9 --instance-type t2.micro --security-group-ids sg-034ef8f5fd18dd359
done    