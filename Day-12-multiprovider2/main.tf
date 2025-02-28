provider "aws" {
  region = "us-east-1"
}

provider "aws" {
  region = "ap-south-1"
  alias  = "mumbai"
}

variable "regions" {
  type = map(object({
    ami               = string
    availability_zone = string
    provider_alias    = string
  }))

  default = {
    "us-east-1"  = { ami = "ami-05b10e08d247fb927", availability_zone = "us-east-1a", provider_alias = "aws" }
    "ap-south-1" = { ami = "ami-0ddfba243cbee3768", availability_zone = "ap-south-1a", provider_alias = "aws.mumbai" }
  }
}

resource "aws_instance" "multi_region" {
  for_each = var.regions

  provider          = each.value.provider_alias == "us-east-1a" ? aws : aws.mumbai
  ami              = each.value.ami
  instance_type    = "t2.micro"
  key_name         = "2802"
  availability_zone = each.value.availability_zone

  tags = {
    Name = "dev-${each.key}"
  }
}
