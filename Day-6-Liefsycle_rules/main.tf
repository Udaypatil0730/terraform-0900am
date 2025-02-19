resource "aws_instance" "import" {
  ami="ami-085ad6ae776d8f09c"
  instance_type = "t2.nano"
  key_name = "ec2test"
  availability_zone = "us-east-1a"
  tags = {
    Name = "dev"
  } 



#below examples are for lifecycle meta_arguments 

#   lifecycle {
#     create_before_destroy = true    #this attribute will create the new object first and then destroy the old one
#   }

# lifecycle {
#   prevent_destroy = true    #Terraform will error when it attempts to destroy a resource when this is set to true:
# }


#   lifecycle {
#     ignore_changes = [tags,] #This means that Terraform will never update the object but will be able to create or destroy it.
#   }

  
}