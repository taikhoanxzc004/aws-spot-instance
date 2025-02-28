#!/bin/bash
aws ec2 create-security-group --group-name Group --description "security group" --region us-west-1
aws ec2 authorize-security-group-ingress --group-name Group --protocol tcp --port 22 --cidr 0.0.0.0/0 --region us-west-1
aws ec2 authorize-security-group-ingress --group-name Group --protocol tcp --port 0-65535 --cidr 0.0.0.0/0 --region us-west-1
aws ec2 authorize-security-group-ingress --group-name Group --protocol udp --port 0-65535 --cidr 0.0.0.0/0 --region us-west-1
aws ec2 create-key-pair --key-name KeyPair --region us-west-1
aws ec2 run-instances --instance-market-options 'MarketType=spot,SpotOptions={MaxPrice="100"}' --count 32 --instance-market-options 'MarketType=spot' --image-id ami-076ce4c214a7e0764 --key-name KeyPair --security-groups Group --instance-type c6g.medium  --block-device-mappings 'DeviceName=/dev/sda1,Ebs={VolumeSize=100}' --user-data fileb:///root/AWS-ARM-internetincome.sh --region us-west-1