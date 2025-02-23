provider "aws" { 
    region = "ap-south-1"
}
resource "aws_s3_bucket" "example" {
  bucket = "asdfqweqrpoiu"
  
}
resource "aws_instance" "dev" {
    ami = "ami-0ddfba243cbee3768"
    instance_type = "t2.micro"
    depends_on = [ aws_s3_bucket.example]
}