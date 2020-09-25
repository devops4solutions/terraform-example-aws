provider "aws" {
  region = var.region
}

module "vpc" {

source = "./modules/vpc"

}


module "network" {

  source = "./modules/network"
  vpc_id = "${module.vpc.vpc_id}" 
  public_subnet_id ="${module.subnet.public_subnet_id}"
private_subnet_id ="${module.subnet.private_subnet_id}"

}
module "subnet" {
source = "./modules/subnets"
vpc_id = "${module.vpc.vpc_id}"
public_rt_id="${module.network.public_rt_id}"
private_rt_id="${module.network.private_rt_id}"
}


module "security_group" {
  source = "./modules/security_groups"
  vpc_id = "${module.vpc.vpc_id}"
}

module "ec2_instance" {
 source = "./modules/ec2-instance"
  vpc_id = "${module.vpc.vpc_id}"
  public_subnet_id ="${module.subnet.public_subnet_id}"
private_subnet_id ="${module.subnet.private_subnet_id}"
FrontEnd_SG_id ="${module.security_group.FrontEnd_SG_id}"
Database_SG_id ="${module.security_group.Database_SG_id}"

}

# this is how you refer the bucket and dynamobdb which you have created in the previous step

terraform {

 backend "s3" {
 bucket = "terraform-remote-state-devops4solutions-bucket-s3"
 dynamodb_table = "terraform-state-lock-dynamo-devops4solutions"
 region = "us-east-2"
 key = "terraform.tfstate"	
 }
}
