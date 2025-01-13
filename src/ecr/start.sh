#!/bin/bash

<< 'comment'
Creates an Amazon ECR repository within a private registry
comment

aws ecr create-repository --repository-name {repository.name} --region {region.code} --cli-input-json file://src/ecr/start.json
