resource "aws_instance" "name" {
    ami = "ami-0ddfba243cbee3768"
    instance_type = "t2.micro"
    key_name = "2301"
    #availability_zone = "us-east-1a"
    #tags = {
    #Name = "dev"
    }
   
  


#Note:When multiple developers work on the same Terraform state file (terraform.tfstate), several problems can arise. These issues can cause conflicts, resource corruption, and deployment failures.
#Merge Conflicts in terraform.tfstate
#If a developer runs terraform plan on an outdated state file, and another applies changes, the state will be out of sync.


#solution is below 
# need to implement state locking provision by using DynamoDB process 