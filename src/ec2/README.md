<br>

**Elastic Compute Container (EC2)**

* [Introducing Launching, Listing, Terminating](https://docs.aws.amazon.com/cli/latest/userguide/cli-services-ec2-instances.html)
* [Launching Instances](https://awscli.amazonaws.com/v2/documentation/api/latest/reference/ec2/run-instances.html)

<br>

## Interacting

<br>

### Connecting

<span style="margin-bottom:5px; margin-top:1px; color:#ffffff"></span>

Programmers may [connect to an instance](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/connect-linux-inst-ssh.html) via

```shell
ssh -i "/{path}/{key-pair-name.pem}" {instance-user-name}@{instance-public-dns-name}
```

The format of the latter is usually of the form

> ec2-user@{...}.{region-name}.compute.amazonaws.com

Ensure you have a [key pair pem (privacy enhanced mail) certificate file](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html).



### Describing

Describe an account's EC2 instances

```shell
aws ec2 describe-instances --profile {profile.name}
```



### EC2, S3, ECR

Interacting with S3 & ECR via EC2 requires a **role** wherein EC2 requests services on our behalf and

* A S3 (Simple Storage Service) permission policy is attached.
* An ECR (Elastic Container Registry) permission [policy](https://docs.aws.amazon.com/AmazonECR/latest/userguide/security-iam-awsmanpol.html) is attached.

<br>

## Launch

<br>

A simple launch example

```shell
aws ec2 run-instances --image-id ami-xxxxxxxx --count 1 --instance-type t2.micro \
  --key-name {key-pair-name} --security-group-ids sg-xxxxxxxx --subnet-id subnet-xxxxxxxx
```

The most efficient launch approach is

```shell
aws ec2 run-instances --user-data file://0001/data.txt --launch-template LaunchTemplateId={launch.template.identier}
```

whereby

* --user-data ...
* --launch-template ...

<br>

### User Data

Outline extra linux installations via `data.txt`.  An example 

```bash
#!/bin/bash
sudo yum update -y

# docker
sudo yum install -y docker
sudo service docker start

# In order to use docker commands without 'sudo'
sudo usermod -a -G docker ec2-user

# time
echo '"ZONE=\"GMT\""' > /etc/sysconfig/clock
ln -sf /usr/share/zoneinfo/GMT /etc/localtime
```

<br>

### Launch Template

A launch template is either created

* [from scratch](docs.aws.amazon.com/AWSEC2/latest/UserGuide/create-launch-template.html)

* [via an existing instance](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/create-launch-template.html#create-launch-template-from-instance).  

In the case of the latter, [the command](https://docs.aws.amazon.com/cli/latest/reference/ec2/get-launch-template-data.html)

```shell
aws ec2 get-launch-template-data --instance-id {instance.identifier} --query "LaunchTemplateData" >> instance.json
```

creates a starting launch template named `instance.json` via existing instance `--instance-id ...`.  A launch template is [deleted](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/delete-launch-template.html) via the command

```shell
aws ec2 delete-launch-template --launch-template-id {launch.template.identifier} --region eu-west-1
```

or similarly

```shell
aws ec2 delete-launch-template-versions --launch-template-id {launch.template.identifier} \
  --versions {version.number} --region eu-west-1
```

<br>

## Terminate

Terminate an instance

```shell
aws ec2 terminate-instances --instance-ids {instance.identifier} --profile {profile.name}
```

<br>
<br>

<br>
<br>

<br>
<br>

<br>
<br>
