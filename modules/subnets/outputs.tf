output "public_subnet_id" {
 value = "${aws_subnet.PublicAZA.id}"
}

output "private_subnet_id" {
 value = "${aws_subnet.PrivateAZA.id}"
}
