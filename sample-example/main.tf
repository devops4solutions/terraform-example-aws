provider "aws" {
  region = var.region
}
# Resource configuration
resource "aws_instance" "test-instance" {
  ami           = "ami-03657b56516ab7912"
  instance_type = "t2.micro"
  tags = {
    Name = "test"
  }
}