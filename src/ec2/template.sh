#!/bin/bash

<< 'comment'
The tag specification format is
    'ResourceType=launch-template,Tags=[{Key=function,Value=testing}]'
comment

aws ec2 create-launch-template --launch-template-name {template.name} --version-description {template.version.description} --tag-specifications {tag.specifications} --launch-template-data file://0001/template.json
