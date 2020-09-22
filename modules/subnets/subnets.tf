variable vpc_id {}
variable public_rt_id {}
variable private_rt_id {}

resource "aws_subnet" "PublicAZA" {
  vpc_id = "${var.vpc_id}"
  cidr_block = "${var.Subnet-Public-AzA-CIDR}"
  availability_zone = "${var.az_1}"
  tags {
        Name = "PublicSubnetAZA"
  }
 
}


resource "aws_route_table_association" "PublicRouteTableAZA" {
    subnet_id = "${aws_subnet.PublicAZA.id}"
    route_table_id = "${var.public_rt_id}"
}


resource "aws_subnet" "PrivateAZA" {
  vpc_id = "${var.vpc_id}"
  cidr_block = "${var.Subnet-Private-AzA-CIDR}"
  availability_zone = "${var.az_2}"
  tags {
        Name = "PrivateSubnetAZB"
  }
}

resource "aws_route_table_association" "PrivateRouteTableAZA" {
    subnet_id = "${aws_subnet.PrivateAZA.id}"
    route_table_id = "${var.private_rt_id}"

}
