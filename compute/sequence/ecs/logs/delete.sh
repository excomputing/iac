#!/bin/bash

: << 'comment'
This script deletes a cloud watch log group
    * https://awscli.amazonaws.com/v2/documentation/api/latest/reference/logs/index.html
    * https://awscli.amazonaws.com/v2/documentation/api/latest/reference/logs/delete-log-group.html
comment

# Path
path=file://compute/sequence/ecs/logs

# Delete Log Group
aws logs delete-log-group --cli-input-json $path/delete.json
