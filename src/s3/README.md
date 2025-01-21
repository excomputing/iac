<br>

## Notes

<br>

### Amazon S3 & Applications

Within an application, interaction with Amazon S3 (Simple Storage Service) is via its [software development kits](https://docs.aws.amazon.com/AmazonS3/latest/userguide/UsingAWSSDK.html).  The Python software development kit (SDK) is [Boto 3](https://boto3.amazonaws.com/v1/documentation/api/latest/reference/services/index.html), whilst the Scala SDK is the [Java SDK](https://sdk.amazonaws.com/java/api/latest/).


<br>

### Amazon S3 & AWS CLI

It is possible to interact with Amazon S3 via two command line interface (CLI) options

* [aws s3](https://docs.aws.amazon.com/cli/latest/userguide/cli-services-s3-commands.html) ([reference pages](https://awscli.amazonaws.com/v2/documentation/api/latest/reference/s3/index.html))
* [aws s3api](https://docs.aws.amazon.com/cli/latest/userguide/cli-services-s3-apicommands.html) ([reference pages](https://awscli.amazonaws.com/v2/documentation/api/latest/reference/s3api/index.html))

<br>

<details><summary><b>Example: aws s3</b></summary>

<br>

[Removing the contents](https://awscli.amazonaws.com/v2/documentation/api/latest/reference/s3/rm.html) of an S3 bucket, and subsequently [deleting the bucket](https://awscli.amazonaws.com/v2/documentation/api/latest/reference/s3/rb.html)

```shell
aws s3 rm s3://{bucket.name}  --recursive
aws s3 rb s3://{bucket.name}
```

</details>

<br>
<br>

<br>
<br>

<br>
<br>

<br>
<br>