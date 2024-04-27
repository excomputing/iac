<br>

Infrastructure as Code & Amazon Web Services

<br>
<br>

# Introduction

The Amazon Web Services CLI (Command Line Interface) tool enables programmatic interaction with <abbr title="Amazon Web Services">AWS</abbr> (Amazon Web Services).  The programmatic interaction illustrations within this repository depend on AWS CLI, hence AWS CLI installation is necessary.

<br>

## Install AWS CLI

[Install](docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)



### Via APT (Advanced Package Tool)

https://www.debian.org/doc/user-manuals#apt-guide
https://ubuntu.com/server/docs/package-management


#### Install

```bash
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
sudo rm -r aws
sudo rm awscliv2.zip
```

#### Update

```bash
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install --bin-dir /usr/local/bin --install-dir /usr/local/aws-cli --update
sudo rm -r aws
sudo rm awscliv2.zip
```


### Via SNAP

https://snapcraft.io/install/aws-cli/ubuntu

https://snapcraft.io/docs/quickstart-tour#list-installed-snaps-2


<br>

## Uninstall

[Uninstall](https://docs.aws.amazon.com/cli/latest/userguide/uninstall.html)

which aws
/usr/local/bin/aws

ls -l /usr/local/bin/aws

sudo rm /usr/local/bin/aws
sudo rm /usr/local/bin/aws_completer
sudo rm -rf /usr/local/aws-cli


<br>
<br>
<br>

# References

* [AWS (Amazon Web Services) CloudFormation](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/CHAP_TemplateQuickRef.html)

<br>
<br>

<br>
<br>

<br>
<br>

<br>
<br>
