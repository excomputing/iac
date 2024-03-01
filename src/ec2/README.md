<br>

**Elastic Compute Container (EC2)**

* [Introducing Launching, Listing, Terminating](https://docs.aws.amazon.com/cli/latest/userguide/cli-services-ec2-instances.html)
* [Launching Instances](https://awscli.amazonaws.com/v2/documentation/api/latest/reference/ec2/run-instances.html)
* [Amazon Machine Images](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/finding-an-ami.html)

<br>

## Interacting

<br>

### Connecting

<span style="margin-bottom:5px; margin-top:1px; color:#ffffff"></span>

Programmers may [connect to an instance](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/connect-linux-inst-ssh.html) via

> ssh -i /path/key-pair-name.pem instance-user-name@instance-public-dns-name


* instance-user-name: ec2-user
* instance-public-dns-name: {internet.protocol.address}.{region.name}.compute.amazonaws.com

wherein `dns` denotes [domain name system](https://docs.aws.amazon.com/vpc/latest/userguide/vpc-dns.html); [more about protocol addresses](https://docs.aws.amazon.com/vpc/latest/userguide/vpc-ip-addressing.html).  Ensure you have a [key pair pem (privacy enhanced mail) certificate file](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html).



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
  --key-name {key.pair.name} --security-group-ids sg-xxxxxxxx --subnet-id subnet-xxxxxxxx
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

A launch template is either [created](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/create-launch-template.html)

* [from scratch](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/create-launch-template.html#create-launch-template-define-parameters)

* [via an existing instance](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/create-launch-template.html#create-launch-template-from-instance).  

In the case of the latter, [the command](https://docs.aws.amazon.com/cli/latest/reference/ec2/get-launch-template-data.html)

```shell
aws ec2 get-launch-template-data --instance-id {instance.identifier} --query "LaunchTemplateData" >> template.json
```

creates a starting launch template named `template.json` via existing instance `--instance-id ...`.  


<br>

Study the sample template [template.template.json](/src/ec2/0001/template.template.json)

|variable|function|
|:---|:---|
|{amazon.resource.name}|The instance profile, which has the required policies for interacting with the Amazon Web Services assets that a task will interact with.|
|{security.group.identifier}|The [security group identification code](https://docs.aws.amazon.com/vpc/latest/userguide/vpc-security-groups.html) of a [virtual private cloud](https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html)|
|{subnet.identifier}|A subnet identification code; about [subnets](https://docs.aws.amazon.com/vpc/latest/userguide/configure-subnets.html), additionally study the [virtual private cloud](https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html) pages.|
|{amazon.machine.image.identifier}|The [identification code of an amazon machine image (AMI)](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/finding-an-ami.html).|
|{instance.type.code}|The [instance type](https://aws.amazon.com/ec2/instance-types/), i.e., hardware, identifier; [more](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-types.html).|
|{key.pair.name}|The name of a [key pair](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html); [creating key pairs](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/create-key-pairs.html).|
|{availability.zone}|A zone of a region, e.g., `eu-west-1a` is a zone of region `eu-west-1`.  For more details visit [*regions, availability zones, local zones*](eu-west-1a) & [*amazon web services service endpoints*](https://docs.aws.amazon.com/general/latest/gr/rande.html)|

<br>

A launch template is [deleted](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/delete-launch-template.html) via the command

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
