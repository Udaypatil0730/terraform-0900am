#example-2
variable "aws_region" {
  description = "The region in which to create the infrastructure"
  type        = string
  default     = "eu-west-1" #here we need to define either us-west-1 or eu-west-2 if i give other region will get error 
  validation {
    condition = var.aws_region == "us-west-2" || var.aws_region == "eu-west-1"
    error_message = "The variable 'aws_region' must be one of the following regions: us-west-2, eu-west-1"
  }
}

provider "aws" {
  region = "ap-south-1"
  
   }

 resource "aws_s3_bucket" "dev" {
    bucket = "statefile-configuresssds"
    
  
}

#after run this will get error like The variable 'aws_region' must be one of the following regions: us-west-2,│ eu-west-1, so it will allow any one region defined above in conditin block

# example-3 with numeric condition in thid condition if ec2 instance = t2.micro only instance will create(count = var.instance_type == "t2.micro" ? 1 : 0) but i am passing t2.nano so ec2 will not create
# variables.tf
# variable "ami" {
#   type    = string
#   default = "ami-0230bd60aa48260c6"
# }

# variable "instance_type" {
#   type = string
#   default = "t2.nano"
# }

# # main.tf
# resource "aws_instance" "dev" {
#   ami           = var.ami
#   instance_type = var.instance_type
#   count         = var.instance_type == "t2.micro" ? 1 : 0
#   tags = {
#     Name = "dev_server"
#   }
# }