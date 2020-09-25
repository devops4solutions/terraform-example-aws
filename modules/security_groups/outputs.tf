output "FrontEnd_SG_id" {
 value = "${aws_security_group.FrontEnd_SG.id}"
}

output "private_subnet_id" {
 value = "${aws_security_group.Database_SG.id}"
}
