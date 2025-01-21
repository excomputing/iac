<br>

Notes

<br>

## Fundamentals

* [CLI](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ECS_AWSCLI_Fargate.html)
* [Console](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/getting-started-fargate.html)
* [ECS Reference](https://docs.aws.amazon.com/cli/latest/reference/ecs/)

<br>

### Actions

[List Clusters](https://awscli.amazonaws.com/v2/documentation/api/latest/reference/ecs/list-clusters.html)
```shell
aws ecs list-clusters
```

[Create Clusters](https://awscli.amazonaws.com/v2/documentation/api/latest/reference/ecs/create-cluster.html)
```shell
aws ecs create-cluster --cluster-name ...
aws ecs list-clusters
```

[Register Task Definition](https://awscli.amazonaws.com/v2/documentation/api/latest/reference/ecs/register-task-definition.html)
```shell
aws ecs register-task-definition --cli-input-json file://src/ecs/task/0002.json
aws ecs list-task-definitions
```

[Service](https://awscli.amazonaws.com/v2/documentation/api/latest/reference/ecs/create-service.html)
```shell
bash service.sh
```

[aws ecs run-task ...](https://awscli.amazonaws.com/v2/documentation/api/latest/reference/ecs/run-task.html)
```shell
aws ecs run-task --cluster GraphicsProcessingUnitCluster --task-definition DailyTaskSpreads --placement-constraints type=memberOf,expression="attribute:ecs.instance-type ==  g3s.xlarge" --region eu-west-1
```

<br>

### References

* Graphics Processing Unit (GPU) & Amazon ECS (Elastic Container Service)
    * [ECS GPU](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-gpu.html)
    * [GPU Launch](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/gpu-launch.html)

* [Agent](https://github.com/aws/amazon-ecs-agent/blob/master/README.md)

* [GPU Instances](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/accelerated-computing-instances.html#gpu-instances)

* [Amazon ECS-optimized AMI](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-optimized_AMI.html)

* [Register](https://awscli.amazonaws.com/v2/documentation/api/latest/reference/ecs/register-container-instance.html)

* [Bootstrapping](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/bootstrap_container_instance.html)

* [Wizard](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/launch_container_instance.html#new-linux-ec2-instance-wizard)


<br>
<br>

<br>
<br>

<br>
<br>

<br>
<br>
