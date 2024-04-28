<br>

**Elastic Compute Container (EC2)**

<br>

* [Launch](#launch)
  * [Launch Template](#launch-template)
  * [User Data](#user-data)
  * [Examples](#examples)
* [Interacting](#interacting)
  * [Connecting](#connecting)
  * [Describing](#describing)
  * [EC2, S3, ECR](#ec2-s3-ecr)
* [Terminating](#terminating)
* [EC2](#ec2-instance-connect-endpoint--ec2-instances)
* [References](#references)


<br>
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
aws ec2 run-instances --user-data file://{user.data.file} --launch-template LaunchTemplateId={launch.template.identier}
```

The next sections describe

* --launch-template
* --user-data: This directive reads from a `.txt` file.


<br>

### Launch Template

A launch template is either [created](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/create-launch-template.html)

* [from scratch](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/create-launch-template.html#create-launch-template-define-parameters)

* [via an existing instance](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/create-launch-template.html#create-launch-template-from-instance).  

In the case of the latter, [the command](https://docs.aws.amazon.com/cli/latest/reference/ec2/get-launch-template-data.html)

```shell
aws ec2 get-launch-template-data --instance-id {instance.identifier} --query "LaunchTemplateData" >> template.json
```

creates a skeleton launch template named `template.json` via the instance identifier of an existing instance.  Study the sample template [iac.json](0003/iac.json), the variables therein are briefly explained below.

<br>

<table style="width: 65%; border: 0; border-spacing: 5px; margin-left: 35px">
  <colgroup>
      <col span="1" style="width: 23.5%;">
      <col span="1" style="width: 49.5%;">
  </colgroup>
  <thead><tr style="text-align: left"><th>variable</th><th>function</th></tr></thead>
  <tr>
    <td>{amazon.resource.name}</td> 
    <td>The instance profile, which has the required policies for interacting with the Amazon Web Services assets that a task will interact with.</td>
  <tr>
  <tr>
    <td>{security.group.identifier}</td> 
    <td>The <a href="https://docs.aws.amazon.com/vpc/latest/userguide/vpc-security-groups.html">security group identification code</a> of a <a href="https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html">virtual private cloud</a></td>
  <tr>
    <td>{subnet.identifier}</td> 
    <td>A subnet identification code; about <a href="https://docs.aws.amazon.com/vpc/latest/userguide/configure-subnets.html">subnets</a>, additionally study the <a href="https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html">virtual private cloud</a> pages.</td>
  <tr>
    <td>{amazon.machine.image.identifier}</td> 
    <td>The <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/finding-an-ami.html">identification code of an amazon machine image (AMI)</a>.</td>
  </tr>
  <tr>
    <td>{instance.type.code}</td> 
    <td>The <a href="https://aws.amazon.com/ec2/instance-types/">instance type</a>, i.e., hardware, identifier; <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-types.html">more</a>.</td>
  </tr>
  <tr>
    <td>{key.pair.name}</td> 
    <td>The name of a <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html">key pair</a>; <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/create-key-pairs.html">creating key pairs</a>.</td>
  </tr>
  <tr>
    <td>{availability.zone}</td> 
    <td>A zone of a region, e.g., <b>eu-west-1a</b> is a zone of region <b>eu-west-1</b>.  For more details visit <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-regions-availability-zones.html"><i>regions, availability zones, local zones</i></a> & <a href="https://docs.aws.amazon.com/general/latest/gr/rande.html"><i>amazon web services service endpoints</i></a></td>
  </tr>
</table>

<br>

A launch template is [deleted](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/delete-launch-template.html) via the command

```shell
aws ec2 delete-launch-template --launch-template-id {launch.template.identifier} --region {region.code}
```

or similarly

```shell
aws ec2 delete-launch-template-versions --launch-template-id {launch.template.identifier} \
  --versions {version.number} --region {region.code}
```

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

### Examples

> [!NOTE]
> In Progress

<table style="width: 65%; border: 0; border-spacing: 5px; margin-left: 35px">
  <colgroup>
      <col span="1" style="width: 23.5%;">
      <col span="1" style="width: 43.5%;">
  </colgroup>
  <thead><tr style="text-align: left"><th>example</th><th>notes</th></tr></thead>
  <tr>
    <td>0001</td> 
    <td>TensorFlow GPU (Graphics Processing Unit) Sandbox</td>
  <tr>
  <tr>
    <td>0002</td> 
    <td>PyTorch GPU (Graphics Processing Unit) Sandbox</td>
  <tr>
    <td>0003</td> 
    <td>Automatically shuts down $13$ minutes after launch; study <a href="0003/data.txt">data.txt</a>.  It only has a public subnet.</td>
  <tr>
    <td>0004</td> 
    <td>Similar to <b>0003</b>, but without an automatic shut down setting, and a private subnet only.</td>
  </tr>
</table>



<br>
<br>

## Interacting


### Connecting

<span style="margin-bottom:5px; margin-top:1px; color:#ffffff"></span>

Programmers may [connect to an instance](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/connect-linux-inst-ssh.html) via

> ssh -i /path/key-pair-name.pem instance-user-name@instance-public-dns-name


* instance-user-name: ec2-user
* instance-public-dns-name: ec2-{internet.protocol.address}.{region.name}.compute.amazonaws.com

wherein `dns` denotes [domain name system](https://docs.aws.amazon.com/vpc/latest/userguide/vpc-dns.html); [more about protocol addresses](https://docs.aws.amazon.com/vpc/latest/userguide/vpc-ip-addressing.html).  Ensure you have a [key pair pem (privacy enhanced mail) certificate file](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html).



### Describing

Describe an account's EC2 instances

```shell
aws ec2 describe-instances --profile {profile.name}
```


### EC2, S3, ECR

Interacting with Amazon <abbr title="Simple Storage Service">S3</abbr> & Amazon <abbr title="Elastic Contatiner Registry">ECR</abbr> via <abbr title="Elastic Compute Container">EC2</abbr> requires a **role** wherein <abbr title="Elastic Compute Container">EC2</abbr> requests services on our behalf **and**

* A S3 (Simple Storage Service) permission policy is attached.
* An ECR (Elastic Container Registry) permission [policy](https://docs.aws.amazon.com/AmazonECR/latest/userguide/security-iam-awsmanpol.html) is attached.

<br>
<br>


## Terminating

Terminate an instance

```shell
aws ec2 terminate-instances --instance-ids {instance.identifier} --profile {profile.name}
```

<br>
<br>

## EC2 Instance Connect Endpoint & EC2 Instances

> [!NOTE]
> In Progress

<br>

### Security Groups 

[Security Groups](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/eice-security-groups.html)

1. The _EC2 Instance Connect Endpoint_ Security Group
2. The _Instance_ Security Group

<br>

### Endpoint

#### Creating

Creating an [EC2 Instance Connect Endpoint](https://docs.aws.amazon.com/cli/latest/reference/ec2/create-instance-connect-endpoint.html)

```bash
aws ec2 create-instance-connect-endpoint --region {region.code} --subnet-id {subnet.identifier}
```

#### Describing

Describing an EICE (EC2 Instance Connect Endpoint) via its identifier

```bash
aws ec2 describe-instance-connect-endpoints --region {region.code} --instance-connect-endpoint-ids {eice.identifier}
```

<br>

### EC2 Machine

Launch an EC2 machine that depends on the endpoint.  Subsequently, connect via

```bash
ssh -i machines.pem ec2-user@{internet.protocol} -o ProxyCommand='aws ec2-instance-connect open-tunnel --instance-id {instance.identifier}'
```

List the machine's details via

```bash
cat /etc/os-release
```

<br>

## References

* [Introducing Launching, Listing, Terminating](https://docs.aws.amazon.com/cli/latest/userguide/cli-services-ec2-instances.html)
* [Launching Instances](https://awscli.amazonaws.com/v2/documentation/api/latest/reference/ec2/run-instances.html)
* [Amazon Machine Images](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/finding-an-ami.html)

<br>
<br>

<br>
<br>

<br>
<br>

<br>
<br>
