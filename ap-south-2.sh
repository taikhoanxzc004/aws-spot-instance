#!/bin/bash
aws ec2 create-security-group --group-name Group --description "security group" --region ap-south-2
aws ec2 authorize-security-group-ingress --group-name Group --protocol tcp --port 22 --cidr 0.0.0.0/0 --region ap-south-2
aws ec2 authorize-security-group-ingress --group-name Group --protocol tcp --port 0-65535 --cidr 0.0.0.0/0 --region ap-south-2
aws ec2 authorize-security-group-ingress --group-name Group --protocol udp --port 0-65535 --cidr 0.0.0.0/0 --region ap-south-2
aws ec2 create-key-pair --key-name KeyPair --region ap-south-2
aws ec2 run-instances --instance-market-options 'MarketType=spot,SpotOptions={MaxPrice="100"}' --count 5 --instance-market-options 'MarketType=spot' --image-id ami-04e0f3ce8cef037d6 --key-name KeyPair --security-groups Group --instance-type c6g.medium  --block-device-mappings 'DeviceName=/dev/sda1,Ebs={VolumeSize=100}' --user-data fileb:///root/AWS-ARM-internetincome.sh --region ap-south-2
