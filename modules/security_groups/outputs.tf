output "FrontEnd_SG_id"
{
    value = "${aws_security_group.FrontEnd_SG.id}"
}

output "Database_SG_id"
{
    value = "${aws_security_group.Database_SG.id}"

}
