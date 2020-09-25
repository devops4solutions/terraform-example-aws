variable vpc_id {}
resource "aws_security_group" "FrontEnd_SG" {
  tags {
        Name = "FrontEnd_SG"
  }
  description = "ONLY HTTP CONNECTION INBOUD"
  vpc_id = "${var.vpc_id}"

  ingress {
        from_port = 80
        to_port = 80
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = "22"
    to_port     = "22"
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "Database_SG" {
  
  tags {
        Name = "Database_SG"
  }
  description = "ONLY tcp CONNECTION INBOUND"
  vpc_id = "${var.vpc_id}"
  ingress {
      from_port = 3306
      to_port = 3306
      protocol = "TCP"
      security_groups = ["${aws_security_group.FrontEnd_SG.id}"]
  }
  ingress {
      from_port   = "22"
      to_port     = "22"
      protocol    = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "FrontEnd_SG_id"
{
    value = "${aws_security_group.FrontEnd_SG.id}"
}

output "Database_SG_id"
{
    value = "${aws_security_group.Database_SG.id}"

}
