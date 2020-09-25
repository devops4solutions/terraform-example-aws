
variable public_subnet_id {}
variable private_subnet_id {}
variable FrontEnd_SG_id {}
variable Database_SG_id {}
variable vpc_id {}

resource "aws_key_pair" "auth" {
  key_name   = var.key_name
  public_key = file(var.public_key_path)
}


resource "aws_instance" "webserver" {
  ami           = var.ami
 connection {
    # The default username for our AMI
    user = "ec2-user"
    host = "aws_instance.webserver.public_ip

    # The connection will use the local SSH agent for authentication.
  }

  instance_type = "t2.micro"
  associate_public_ip_address = "true"
  subnet_id = var.public_subnet_id
  vpc_security_group_ids = [var.FrontEnd_SG_id]
 key_name = aws_key_pair.auth.id
 tags = {
        Name = "webserver"
  }
  
}

