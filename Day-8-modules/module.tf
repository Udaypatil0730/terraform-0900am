    module "prod" {
    source = "../Day-2-basic-module-for-source"
    ami_id = "ami-0ddfba243cbee3768"
    type = "t2.nano"
    key = "2301"
   
}
  
