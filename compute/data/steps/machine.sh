#!/bin/bash

: << 'comment'
This script assumes that (a) the Amazon ECS (Elastic Container Service) Cluster the machine depends on 
is active, and (b) the machine's underlying task/s is/are active. 
comment

# Path
path=file://compute/data/steps

# The state machine.
aws stepfunctions create-state-machine --cli-input-json $path/define.json --definition $path/machine.asl.json
