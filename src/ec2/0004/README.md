<br>

## EC2 Machines & Private Access

Interacting with EC2 (Elastic Compute Cloud) machines via private tunnels, i.e., without a public internet protocol version 4 (IPv4) address, or similar.  The example herein achieves this via <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/connect-with-ec2-instance-connect-endpoint.html" target="_blank">EICE</a> (EC2 Instance Connect Endpoint) instead.


|method|cost per hour<br> united states dollar|
|:----------|:-----|
|Public IPv4|0.0005|
|EICE|0|


<br>


### Building a machine launch template

The templating buildng script depends on the launch template data [iac.json](iac.json).  Beware of the variables therein, e.g., {amazon.resource.name}, {subnet.identifier}, etc.  Edit the variables accordingly before running

```bash
bash src/ec2/0004/build.sh
```

For this example, ensure the subnet is a private subnet.  Visit Amazon's pages for more details about <a href="https://awscli.amazonaws.com/v2/documentation/api/latest/reference/ec2/create-launch-template.html">launch templates</a>.


<br>


### Before launching

A simple option for accessing an instance that only has a private subnet, is to associate the private subnet with an <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/connect-with-ec2-instance-connect-endpoint.html" target="_blank">EICE</a> (EC2 Instance Connect Endpoint); <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/create-ec2-instance-connect-endpoints.html#create-eice-cli" target="_blank">more</a>.  The relevant command is 

```bash
aws ec2 create-instance-connect-endpoint --subnet-id {subnet.identifier}
```

It creates the endpoint, and associates it with a subnet in question.  Details of endpoints, and their associated subnets, are retrivable via

```bash
aws ec2 describe-instance-connect-endpoints --region {region.code}
```


<br>


### Launching a machine

Launch this section's machine via

```bash
bash src/ec2/0004/launch.sh
```

The subsequent launch details will include an instance identifier and a private internet protocol address.  Hence, connect via

```bash
ssh -i machines.pem ec2-user@{private.internet.protocol} -o \
    ProxyCommand='aws ec2-instance-connect open-tunnel --instance-id {instance.identifier}'
```


<br>


### Features

Note, this example is designed to shut down after 13 minutes; study [data.txt](data.txt).  After shutting down, the machine is terminated via the *instance shutdown behaviour* setting of [iac](iac.json); parameter `InstanceInitiatedShutdownBehavior`.

Additionally, the <a href="https://docs.aws.amazon.com/ebs/latest/userguide/what-is-ebs.html" target="_blank">Elastic Block Store (EBS)</a> volume is deleted on termination; study the network interfaces section of [iac](iac.json), it includes the parameter `DeleteOnTermination`.

```json
"NetworkInterfaces": [
        {
            "AssociatePublicIpAddress": false,
            "DeleteOnTermination": true,
            "Description": "",
            "DeviceIndex": 0,
            "Groups": [
                "{security.group.identifier}"
            ],
            "InterfaceType": "interface",
            "Ipv6Addresses": [],
            "SubnetId": "{subnet.identifier}",
            "NetworkCardIndex": 0
        }
    ]
```

<br>
<br>

<br>
<br>

<br>
<br>

<br>
<br>
