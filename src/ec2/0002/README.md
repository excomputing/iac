<br>

It's prudent to investigate the features of a GPU (Graphics Processing Unit) enabled machine.

<br>

### Specifications

In the case of this *0002* example:

* Image Identifier: ami-0a654345356bc5a02 
  * Tag: Deep Learning OSS (Open Source Software) NVIDIA Driver <abbr title="Amazon Machine Image">AMI</abbr> <abbr title="Graphics Processing Unit">GPU</abbr>, PyTorch 2.2.0 (Amazon Linux 2) 20240420
  * [About Amazon Deep Learning Images](https://aws.amazon.com/releasenotes/aws-deep-learning-base-ami-amazon-linux-2/)
* Instance Type: g4dn.xlarge
  * [vCPU](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-optimize-cpu.html) $\rightarrow$ 4, CPU Core $\rightarrow$ 2, Threads per Core $\rightarrow$ 2
  * [G4](https://aws.amazon.com/ec2/instance-types/g4/#:~:text=Product%20Details,-Instance%20Size)
  * [Instance Types](https://docs.aws.amazon.com/ec2/latest/instancetypes/ac.html)


[Beware of the values of](iac.json)

* ImageId
* InstanceType
* CpuOptions.CoreCount
* CpuOptions.ThreadsPerCore

<br>
<br>

### The Machine

About:

```bash
cat /etc/os-release
```

The machine's environment variables:

```bash
env
```

The machine's CUDA specifications:

```bash
nvidia-smi
```

If the machine's shell has not undergone `conda activate` configuration, run

```bash
conda init bash
```

For more details visit the [conda init](https://docs.conda.io/projects/conda/en/stable/commands/init.html) pages.  Subsequently, exit the machine and re-login.

List the virtual private environments via

```bash
conda info --envs
```

