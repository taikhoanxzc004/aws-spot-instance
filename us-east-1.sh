#!/bin/bash
aws ec2 create-security-group --group-name Group --description "security group" --region us-east-1
aws ec2 authorize-security-group-ingress --group-name Group --protocol tcp --port 22 --cidr 0.0.0.0/0 --region us-east-1
aws ec2 authorize-security-group-ingress --group-name Group --protocol tcp --port 0-65535 --cidr 0.0.0.0/0 --region us-east-1
aws ec2 authorize-security-group-ingress --group-name Group --protocol udp --port 0-65535 --cidr 0.0.0.0/0 --region us-east-1
aws ec2 create-key-pair --key-name KeyPair --region us-east-1
aws ec2 run-instances --instance-market-options 'MarketType=spot,SpotOptions={MaxPrice="100"}' --count 32 --instance-market-options 'MarketType=spot' --image-id ami-07ee04759daf109de --key-name KeyPair --security-groups Group --instance-type c7g.medium  --block-device-mappings 'DeviceName=/dev/sda1,Ebs={VolumeSize=100}' --user-data fileb:///root/AWS-ARM-internetincome.sh --region us-east-1