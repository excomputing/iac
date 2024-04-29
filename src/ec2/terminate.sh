#!/bin/bash

<< 'comment'
For deleting an EC2 (Elastic Compute Cloud) instance via its instance 
identifier, i.e., {instance.identifier}.
comment

aws ec2 terminate-instances --instance-ids {instance.identifier}
