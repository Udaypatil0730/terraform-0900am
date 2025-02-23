provider "aws" {
  
}

data "aws_subnet" "selected" {
  filter {
    name   = "tag:Name"
    values = ["subnet-1"] # insert value here
  }
}
data "aws_security_groups" "selected" {
  filter {
    name   = "tag:Name"
    values = ["default"] # insert value here
  }
}



resource "aws_instance" "dev" {
    ami = "ami-0ddfba243cbee3768"
    instance_type = "t2.nano"
    subnet_id = data.aws_subnet.selected.id
    vpc_security_group_ids = [data.aws_security_groups.selected.ids[0]]

}
