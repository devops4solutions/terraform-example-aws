#variable vpc_id {}

resource "aws_subnet" "PublicAZA" {
  vpc_id = var.vpc_id"
  cidr_block = "${var.Subnet-Public-AzA-CIDR}"
  tags = {
        Name = "PublicSubnetAZA"
  }
 
}
