<br>

Notes

<br>

# Elastic Compute Container (EC2)

## Interactive Snippets

<span style="margin-bottom:5px; margin-top:1px; color:#ffffff"></span>

Foremost, [connecting to an instance](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/connect-linux-inst-ssh.html)

```shell
ssh -i "/{path}/{key-pair-name.pem}" {instance-user-name}@{instance-public-dns-name}
```

The format of the latter is usually of the form

> ec2-user@{...}.{region.name}.compute.amazonaws.com

<br>

Describe an account's EC2 instances

```shell
aws ec2 describe-instances --profile {profile.name}
```

<br>

Terminate an instance

```shell
aws ec2 terminate-instances --instance-ids {instance.id} --profile {profile.name}
```

<br>
<br>

<br>
<br>

<br>
<br>

<br>
<br>
