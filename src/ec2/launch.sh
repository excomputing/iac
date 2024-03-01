#!/bin/bash

<< 'comment'
{launch.template.identifier}: The identification code of a launch template
comment

aws ec2 run-instances --user-data file://0001/data.txt --launch-template LaunchTemplateId={launch.template.identifier}
