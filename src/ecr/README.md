<br>

Elastic Container Registry (ECR)

<br>

# Notes

Interacting via [aws cli](https://awscli.amazonaws.com/v2/documentation/api/latest/reference/ecr/index.html)


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
<br>

<br>
<br>

<br>
<br>

<br>
<br>
