<br>

# Elastic Container Registry (ECR)

<br>

About [ECR](https://docs.aws.amazon.com/AmazonECR/latest/userguide/what-is-ecr.html), interacting with ECR via [aws cli](https://awscli.amazonaws.com/v2/documentation/api/latest/reference/ecr/index.html), and [pricing](https://aws.amazon.com/ecr/pricing/).

<br>
<br>

## Public

The [public gallery](https://gallery.ecr.aws) ...

```shell
aws ecr-public get-login-password --region {region.code} | docker login --username AWS \
     --password-stdin public.ecr.aws
```


<br>
<br>

## Private

The data science team will use private ECR repositories; team member's should ask after the team's region code.

<br>

### Fundamentals

Create a repository via 

```shell
aws ecr create-repository --repository-name {repository.name} --region {region.code}
```

For example

```bash
aws ecr create-repository --repository-name trees --region ca-west-1
```

Always deliver images via a version control system, e.g. GitHub; study the this <a href="https://github.com/enqueter/pollutants/blob/bc73be88345ccb36864a9721dac4708bbf6da281/.github/workflows/main.yml#L179">workflow code</a>, which automatically delivers an image to ECR via GitHub Actions directives.

<br>

<details><summary><b>Extracurricular</b></summary>
<br>

<h4><b>Direct Delivery</b></h4>

For teams that deliver images to Amazon ECR directly.  Imagine you have a local image with the tag

> viruses

Foremost, prepare the image for delivery via the command

```shell
docker tag {image.tag} {aws.account.identifier}.dkr.ecr.{region.code}.amazonaws.com/{repository.name}
```

Whereby

 * {image.tag} $\Rightarrow$ viruses
 * {aws.account.identifier}: Your account identification code
 * {region.code}: An Amazon region code
 * {repository.name}: The name of a Amazon ECR private repository

<br>

Next, log into Amazon ECR Registry

```shell
aws ecr get-login-password --region {region.code} | docker login --username AWS \
     --password-stdin {aws.account.identifier}.dkr.ecr.{region.code}.amazonaws.com
```

Finally, push the image into an Amazon ECR repository

```shell
docker push \
     {aws.account.identifier}.dkr.ecr.{region.code}.amazonaws.com/{repository.name}:{image.tag}
```

<h4><b>Deleting</b></h4>

Delete one or more images via

```shell
aws ecr batch-delete-image \
     --repository-name {repository.name} \
     --image-ids imageTag={image.tag} imageTag={image.tag}
```

Delete an empty repository via

```shell
aws ecr delete-repository \
    --repository-name {repository.name} \
```

Delete a repository and all its images via

```shell
aws ecr delete-repository --repository-name {repository.name} --region {region.code} --force
```

</details>


<br>
<br>


### Interacting

Interactions via Amazon CLI (Command Line Interface).

<br>

#### Local

Initially, [login via](https://docs.aws.amazon.com/AmazonECR/latest/userguide/registry_auth.html)

```shell
aws ecr get-login-password --region {region.code} | docker login --username AWS \
     --password-stdin {aws.account.identifier}.dkr.ecr.{region.code}.amazonaws.com
```

Note that the login name of the user is **always AWS**.

<br>

**Pull** an image via the command

```shell
docker pull \
     {aws.account.identifier}.dkr.ecr.{region.code}.amazonaws.com/{repository.name}:{image.tag}
```

<br>

#### Elastic Compute Cloud (EC2)

Within an EC2 instance, the `sudo` key might be required, i.e.,

```shell
aws ecr get-login-password --region {region.code} | sudo docker login --username AWS \ 
     --password-stdin {aws.account.identifier}.dkr.ecr.{region.code}.amazonaws.com
sudo docker pull \
     {aws.account.identifier}.dkr.ecr.{region.code}.amazonaws.com/{repository.name}:{image.tag}
sudo docker run \
     {aws.account.identifier}.dkr.ecr.{region.code}.amazonaws.com/{repository.name}:{image.tag}
```

**However**, if an EC2 machine is launched with a user data file that ensures docker usage without `sudo`, e.g.,

> aws ec2 run-instances --user-data [file://src/ec2/0003/data.txt](../ec2/0003/data.txt) --launch-template LaunchTemplateId={launch.template.identifier}

Then a `sudo` key will not be required for docker commands, i.e.,

```shell
aws ecr get-login-password --region {region.code} | docker login --username AWS \
    --password-stdin {aws.account.identifier}.dkr.ecr.{region.code}.amazonaws.com
docker pull \
     {aws.account.identifier}.dkr.ecr.{region.code}.amazonaws.com/{repository.name}:{tag.name}
docker run \
     {aws.account.identifier}.dkr.ecr.{region.code}.amazonaws.com/{repository.name}:{tag.name}
```


<br>
<br>


### Deleting

Deleting one or more images via their tags

```shell
aws ecr batch-delete-image \
     --repository-name {repository.name} \
     --image-ids imageTag={tag.name} imageTag={tag.name}
```

<br>

Deleting a single image at a time via the image's _image digest_

```shell
aws ecr batch-delete-image \
     --repository-name {repository.name} \
     --image-ids imageDigest={image.digest}
```

<br>

Deleting multiple images at a time via their _image digest_

```shell
aws ecr batch-delete-image \
     --repository-name {repository.name} \
     --image-ids imageDigest={image.digest} imageDigest={image.digest}
```


<br>
<br>

<br>
<br>

<br>
<br>

<br>
<br>
