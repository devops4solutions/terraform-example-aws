variable "region" {
  default = "us-east-2"
}

variable "ami" {
  default="ami-03657b56516ab7912"
}

variable "key_name" {
  default = "ansible_aut.pem"
  description = "the ssh key to use in the EC2 machines"
}
variable "public_key_path" {
  default = "~/.ssh/id_rsa.pub"
}


