# example-1 s3 bucket creation condition based 
provider "aws" {
 region = "us-east-1"
}

variable "create_bucket" {
description = "Set to true to create the S3 bucket."
type        = bool
 default    = false
}

resource "aws_s3_bucket" "example" {
   count = var.create_bucket ? 1 : 0
   bucket= "tesfhatshdvhsdfgkkx"

  tags = {
     Name        = "ConditionalBucket"
     Environment = "Dev"
   }
 }


