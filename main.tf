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


# this is how you refer the bucket and dynamobdb which you have created in the previous step

terraform {

 backend "s3" {
 bucket = "terraform-remote-state-devops4solutions-bucket-s3"
 dynamodb_table = "terraform-state-lock-dynamo-devops4solutions"
 region = "us-east-2"
 key = "terraform.tfstate"	
 }
}
