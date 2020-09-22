variable "Subnet-Public-AzA-CIDR" {
  default = "10.101.1.0/24"
  description = "the cidr of the public subnet"
}
variable "Subnet-Private-AzA-CIDR" {
  default = "10.101.2.0/24"
  description = "the cidr of the private subnet"
}
variable "az_1" {
  default     = "us-west-2b"
  description = "Your Az1, use AWS CLI to find your account specific"
}

variable "az_2" {
  default     = "us-west-2c"
  description = "Your Az2, use AWS CLI to find your account specific"
}
