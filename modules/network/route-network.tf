/* EXTERNAL NETWORG , IG, ROUTE TABLE */
variable "vpc_id"  {}
variable "public_subnet_id" {}
variable "private_subnet_id" {}

resource "aws_internet_gateway" "gw" {
   vpc_id = var.vpc_id
    tags = {
        Name = "internet gw terraform generated"
    }
}

# Creating Network access control
resource "aws_network_acl" "nacl" {
   vpc_id = var.vpc_id
    subnet_ids = [var.public_subnet_id,var.private_subnet_id]
    egress {
        protocol = "-1"
        rule_no = 2
        action = "allow"
        cidr_block =  "0.0.0.0/0"
        from_port = 0
        to_port = 0
    }
    ingress {
        protocol = "-1"
        rule_no = 1
        action = "allow"
        cidr_block =  "0.0.0.0/0"
        from_port = 0
        to_port = 0
    }
    tags = {
        Name = "openacsl"
    }
}

resource "aws_eip" "eip_forNat" {
    vpc      = true
}
resource "aws_nat_gateway" "NatGateway" {
    allocation_id = aws_eip.eip_forNat.id
    subnet_id = var.public_subnet_id
    depends_on = [aws_internet_gateway.gw]
}

resource "aws_route_table" "public_rt" {
  vpc_id = var.vpc_id
  tags = {
      Name = "Public_RT"
  }
  route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.gw.id
    }
}


resource "aws_route_table" "private_rt" {
  vpc_id = var.vpc_id
  tags = {
      Name = "Privat_RT"
  }
  route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.NatGateway.id
  }
}
