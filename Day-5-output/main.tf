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
 #   bucket         = "veeranareshitdevops"  # Name of the S3 bucket where the state will be stored.
  #  region         =  "us-east-1"
   # key            = "day-5/terraform.tfstate" # Path within the bucket where the state will be read/written.
    #dynamodb_table = "terraform-state-lock-dynamo" # DynamoDB table used for state locking, note: first run day-4-s3-dynamodb resource then day-4-state-remote-backend
    #encrypt        = true  # Ensures the state is encrypted at rest in S3.
#}
#}