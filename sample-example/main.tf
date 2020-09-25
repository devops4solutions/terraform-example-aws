provider "aws" {
 region = var.region
 }
# Resource configuration
resource "aws_instance" "test-instance" {
 ami = "ami-223f945a"
 instance_type = "t2.micro"
 tags = {
 Name = "test"
 }
}