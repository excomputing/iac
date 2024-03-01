#!/bin/bash

<< 'comment'
{instance.identifier}: The identification code of an Amazon Elastic Cloud Compute (EC2)
comment

aws ec2 terminate-instances --instance-ids {instance.identifier}
