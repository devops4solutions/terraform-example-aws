resource "aws_network_acl" "nacl_public" 
{
   vpc_id = var.vpc_id
    subnet_ids = [var.public_subnet_id]


//	Allows outbound HTTPS traffic from the subnet to the Internet.
 egress {
        rule_no = 110
        action = "allow"
        cidr_block =  "0.0.0.0/0"
        protocol="tcp"
        from_port = 443
        to_port = 443
    }

//Allows outbound HTTP traffic from the subnet to the Internet.
egress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_block = "0.0.0.0/0"
        rule_no =100
        action="allow"
  }

// Allows outbound MY SQL access to database servers in the private subnet. CIDR block of DB private subnet
egress {
        from_port = 3306
        to_port = 3306
        protocol = "tcp"
        cidr_block = var.private_subnet_id
        rule_no =120
        action="allow"
  }

egress {
        from_port = 3306
        to_port = 3306
        protocol = "tcp"
        cidr_block = var.private_subnet_id
        rule_no =130
        action="allow"
  }

//Allows outbound responses to clients on the Internet (for example, serving web pages to people visiting the web servers in the subnet).
egress {
        from_port = 32768
        to_port = 65535
        protocol = "tcp"
        cidr_block = "0.0.0.0/0"
        rule_no =140
        action="allow"
  }
// Allows outbound SSH access to instances in your private subnet (from an SSH bastion, if you have one).
egress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_block = "0.0.0.0/0"
        rule_no =150
        action="allow"
  }


   
      ingress {
        rule_no = 110
        action = "allow"
        cidr_block =  "0.0.0.0/0"
        protocol="tcp"        
        from_port = 443
        to_port = 443
    }

ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_block = "0.0.0.0/0"
        rule_no =90
        action="allow"
  }

ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_block = "0.0.0.0/0"
        rule_no =100
        action="allow"
  }

ingress {
        from_port = 1024
        to_port = 65535
        protocol = "tcp"
        cidr_block = "0.0.0.0/0"
        rule_no =140
        action="allow"
  }


   tags = {
        Name = "nacl_public"
    }
}

