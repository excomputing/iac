#!/bin/bash

aws ecs create-service --cluster ExploratoryCluster --service-name fluid --cli-input-json file://src/ecs/service/0002.json
