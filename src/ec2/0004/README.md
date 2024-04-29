
### Building a machine launch template

The templating buildng script depends on the launch template data [iac.json](iac.json).  Beware of the variables therein, e.g., {amazon.resource.name}, {subnet.identifier}, etc.  Edit the variables accrdingly before running

```bash
bash src/ec2/0004/build.sh
```

For this example, ensure the subnet is a private subnet.

<br>


### Before launching

A simple option for accessing an instance that only has a private subnet, is to associate the private subnet with an EICE ().  The relevant command is 

```bash
aws ec2 create-instance-connect-endpoint --subnet-id {subnet.identifier}
```

It creates the endpoint and associates it with a subnet in question.  Details of endpoints, and their associated subnets, are retrivable via

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

Note, this example is designed to shut down after 13 minutes; study [data.txt](data.txt).  After shutting down, the machine is terminated; study the network interfaces section of [iac](iac.json), it includes the parameter `DeleteOnTermination`.

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
