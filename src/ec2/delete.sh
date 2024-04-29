#!/bin/bash

: << 'comment'
For deleting an EC2 (Elastic Compute Cloud) launch template via its launch template identifier.
comment

aws ec2 delete-launch-template --launch-template-id {launch.template.identifier} --region {region.code}
