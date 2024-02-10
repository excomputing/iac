<br>

Notes

<br>

# Elastic Compute Container (EC2)

## Connecting

<span style="margin-bottom:5px; margin-top:1px; color:#ffffff"></span>

Programmers may [connect to an instance](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/connect-linux-inst-ssh.html) via

```shell
ssh -i "/{path}/{key-pair-name.pem}" {instance-user-name}@{instance-public-dns-name}
```

The format of the latter is usually of the form

> ec2-user@{...}.{region.name}.compute.amazonaws.com

Ensure you have a [key pair pem (privacy enhanced mail) certificate file](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html).

<br>

## Describing

Describe an account's EC2 instances

```shell
aws ec2 describe-instances --profile {profile.name}
```

<br>

## Terminating

Terminate an instance

```shell
aws ec2 terminate-instances --instance-ids {instance.id} --profile {profile.name}
```

<br>

## Launching

Launch Template

```shell
aws ec2 delete-launch-template --launch-template-id {launch.template.identifier} --region eu-west-1
```

Addendum

```shell
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

## EC2, S3, ECR

Interaction with S3 & ECR via EC2 requires a **role** wherein

* EC2 requests services on our behalf.
* A S3 permission policy attached.
* An ECR permission [policy](https://docs.aws.amazon.com/AmazonECR/latest/userguide/security-iam-awsmanpol.html) attached.

```shell
docker pull {account.identifier}.dkr.ecr.{region.name}.amazonaws.com/{repository.name}:{tag.name}
```

<br>
<br>

<br>
<br>

<br>
<br>

<br>
<br>
