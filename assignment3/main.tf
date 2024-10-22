provider "aws" {
  region = "us-east-1"
}

data "aws_availability_zones" "available" {}

module "vpc" {
  source = "git::https://github.com/20Vinay23/terraform-assingment.git//modules/vpc?ref=master"
  cidr   = "10.0.0.0/16"
  azs    = data.aws_availability_zones.available.names
  public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets = ["10.0.3.0/24", "10.0.4.0/24"]
  tags = {
    Name = "MyTestVpc"
  }
}

module "webserver" {
  source           = "./modules/webserver"
  key_pair_name    = "my-terraform-key"
  private_key_path = "/home/vinay.kumar3@happiestminds.com/.ssh/id_rsa"
}

resource "aws_security_group_rule" "allow_http" {
  type = "ingress"
  from_port = 80
  to_port = 80
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = module.vpc.default_security_group_id
}

resource "aws_security_group_rule" "allow_ssh" {
  type = "ingress"
  from_port = 22
  to_port = 22
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = module.vpc.default_security_group_id
}

resource "aws_security_group_rule" "allow_all_outbound-2" {
  type = "egress"
  from_port = 0
  to_port = 0
  protocol = "-1"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = module.vpc.default_security_group_id
}

output "web_instance_public_ip" {
  value = module.webserver.web_instance_public_ip
}

output "vpc_id" {
  value = module.vpc.vpc_id
}
