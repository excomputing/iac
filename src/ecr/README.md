<br>

Elastic Container Registry (ECR)

<br>

# Notes

About [ECR](https://docs.aws.amazon.com/AmazonECR/latest/userguide/what-is-ecr.html), and interacting with ECR via [aws cli](https://awscli.amazonaws.com/v2/documentation/api/latest/reference/ecr/index.html)


## Deleting

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
