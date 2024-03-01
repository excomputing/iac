<br>

**Elastic Compute Container (EC2)**

<br>

## Interacting

### Connecting

<span style="margin-bottom:5px; margin-top:1px; color:#ffffff"></span>

Programmers may [connect to an instance](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/connect-linux-inst-ssh.html) via

```shell
ssh -i "/{path}/{key-pair-name.pem}" {instance-user-name}@{instance-public-dns-name}
```

The format of the latter is usually of the form

> ec2-user@{...}.{region.name}.compute.amazonaws.com

Ensure you have a [key pair pem (privacy enhanced mail) certificate file](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html).

<br>

### Describing

Describe an account's EC2 instances

```shell
aws ec2 describe-instances --profile {profile.name}
```

<br>

### EC2, S3, ECR

Interacting with S3 & ECR via EC2 requires a **role** wherein

* EC2 requests services on our behalf.
* A S3 permission policy attached.
* An ECR permission [policy](https://docs.aws.amazon.com/AmazonECR/latest/userguide/security-iam-awsmanpol.html) attached.

<br>

## Launch, List, Terminate

* [Reference](https://docs.aws.amazon.com/cli/latest/userguide/cli-services-ec2-instances.html)


### Terminate

Terminate an instance

```shell
aws ec2 terminate-instances --instance-ids {instance.id} --profile {profile.name}
```

<br>

### Launch Templates

[Creating](docs.aws.amazon.com/AWSEC2/latest/UserGuide/create-launch-template.html)

Start with [an existing instance](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/create-launch-template.html#create-launch-template-from-instance).  Via

```shell
aws ec2 get-launch-template-data --instance-id {instance.id} --query "LaunchTemplateData" >> instance.json
```

acquire an editable launch template structure.

<br>

[Deleting](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/delete-launch-template.html)

```shell
aws ec2 delete-launch-template --launch-template-id {launch.template.identifier} --region eu-west-1
```

```shell
aws ec2 delete-launch-template-versions --launch-template-id {launch.template.identifier} \
  --versions {version.number} --region eu-west-1
```
<br>

**Template Sections**

* [Creating a Launch Template](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/create-launch-template.html)

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
<br>

<br>
<br>

<br>
<br>

<br>
<br>
