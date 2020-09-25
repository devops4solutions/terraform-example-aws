variable public_subnet_id {}
variable private_subnet_id {}
variable Database_SG_id {}
#variable vpc_id {}
resource "aws_db_instance" "mysqlDbInstance" {
 #    vpc_id = "${var.vpc_id}"
  #depends_on             =["var.Database_SG"]
  identifier             = "${var.identifier}"
  allocated_storage      = "${var.storage}"
  engine                 = "${var.engine}"
  engine_version         = "${lookup(var.engine_version, var.engine)}"
  instance_class         = "${var.instance_class}"
  name                   = "${var.db_name}"
  username               = "${var.username}"
  password               = "${var.password}"
  vpc_security_group_ids = ["${var.Database_SG_id}"]
  db_subnet_group_name   = "${aws_db_subnet_group.subnetGroup.id}"
}

resource "aws_db_subnet_group" "subnetGroup" {
  name        = "main_subnet_group"
  description = "Our main group of subnets"
  subnet_ids  = ["${var.public_subnet_id}", "${var.private_subnet_id}"]
}

output "subnet_group" {
  value = "${aws_db_subnet_group.subnetGroup.name}"
}

output "db_instance_id" {
  value = "${aws_db_instance.mysqlDbInstance.id}"
}

output "db_instance_address" {
  value = "${aws_db_instance.mysqlDbInstance.address}"
}
