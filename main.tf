provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  cidr   = var.cidr
  azs    = var.azs
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "MyNewVpc"
  }
}
