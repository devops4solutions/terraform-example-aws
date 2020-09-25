provider "aws" {
  region = var.region
}

module "vpc" {

source = "./modules/vpc"

}


module "subnet" {
  source = "./modules/subnets"
  vpc_id = "${module.vpc.vpc_id}"
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
