variable "region" {
  default = "us-west-2"
}
variable "ami" {
type = "map"
  default =
{
us-west-2= "ami-223f945a"
}
}
variable "key_name" {
  default = "EC2_Key"
  description = "the ssh key to use in the EC2 machines"
}
variable "public_key_path" {
  default = "~/.ssh/id_rsa.pub"
}


