provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "dev" {
    ami = "ami-05c179eced2eb9b5b"
    instance_type = "t2.nano"
    tags = {
      Name = "dev12345678"
    }
}
