provider "aws" {
  region = var.region
}
# Resource configuration
resource "aws_instance" "test-instance" {
  ami           = var.ami
  instance_type = "t2.micro"
  tags = {
    Name = "test"
  }
}