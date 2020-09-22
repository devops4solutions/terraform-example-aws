
output "public_rt_id" {
  value = "${aws_route_table.public_rt.id}"
}
output "private_rt_id" {
  value = "${aws_route_table.private_rt.id}"
}

