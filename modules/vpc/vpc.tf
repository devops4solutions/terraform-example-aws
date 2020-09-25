resource "aws_vpc" "terraform_vpc" { 
  cidr_block = var.vpc-fullcidr
 #### this 2 true values are for use the internal vpc dns resolution
enable_dns_support = true
    enable_dns_hostnames = true
 tags = {
    Name = "terraform_vpc"
  }
}

resource "aws_flow_log" "vpc_flow_log" {
  log_group_name = aws_cloudwatch_log_group.vpc_cloudwatch_log_group.name
 iam_role_arn   = var.vpcflowlogsrole_arn
  vpc_id         = aws_vpc.terraform_vpc.id
  traffic_type   = "ALL"
}

resource "aws_cloudwatch_log_group" "vpc_cloudwatch_log_group" {
  name = "vpc_cloudwatch_log_group"
}

