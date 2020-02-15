# Set AWS Credentials
provider "aws" {
  region     = "eu-west-1"
  access_key = "changed"
  secret_key = "changed"
}

variable "S3BucketName" {
  type = "string"
   default = "vishnu-bucket-v5"
}

variable "S3BucketAccess" {
  type = "string"
  default = "private"
}

variable "BucketVersioning" {
  type = bool
  default = true
}

resource "aws_s3_bucket" "b" {
  bucket = "${var.S3BucketName}"
  acl    = "${var.S3BucketAccess}"
    versioning {
         enabled = "${var.BucketVersioning}"
    }
  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}



# Creating Lambda resource

resource "aws_iam_role" "iam_for_lambda" {
  name = "iam_for_lambda"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

variable "lambda_function_name" {
  type = "string"
}
resource "aws_lambda_function" "test_lambda" {
  filename      = "sourcecode-v2.zip"
  function_name = "${var.lambda_function_name}"
  role          = "${aws_iam_role.iam_for_lambda.arn}"
  handler       = "index.js"
  source_code_hash = "${filebase64sha256("sourcecode-v2.zip")}"

  runtime = "nodejs12.x"

  environment {
    variables = {
      foo = "bar"
    }
  }
}
