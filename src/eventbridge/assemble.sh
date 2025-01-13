#!/bin/bash

aws scheduler create-schedule --cli-input-yaml file://src/eventbridge/schedule.yaml
