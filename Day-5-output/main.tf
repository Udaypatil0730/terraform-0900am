resource "aws_instance" "dev" {
    ami = "ami-0ddfba243cbee3768"
    instance_type = "t2.micro"
    key_name = "2301"
    availability_zone = "ap-south-1a"
    tags = {
      Name = "dev"
    }
   
}

#creating s3 bucket and dynamo DB for state backend storgae and applying the lock mechanisam for statefile

# This backend configuration instructs Terraform to store its state in an S3 bucket.
#terraform {
  #backend "s3" {
    #bucket         = "spyderabc"                         # Name of the S3 bucket to store the Terraform state file
    #key            = "day-5/terraform.tfstate"           # File path inside the S3 bucket
    #region         = "ap-south-1"                        # AWS region of the S3 bucket and DynamoDB table
    #dynamodb_table = "terraform-state-lock-dynamo"       # DynamoDB table for state locking
    #encrypt        = true                                # Encrypt the state file at rest in S3
  #}
#}