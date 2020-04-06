provider "aws" {
  region = var.aws_region
}

data "aws_vpc" "default" {
  default = true
}

data "aws_subnet_ids" "all" {
  vpc_id = data.aws_vpc.default.id
}

module "security_group" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "foldingAtHome"
  description = "Security group"
  vpc_id      = data.aws_vpc.default.id

  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["http-80-tcp", "all-icmp"]
  egress_rules        = ["all-all"]
}

module "ec2_spot_cluster" {
  source                 = "github.com/httpdss/terraform-aws-ec2-spot-instance"
  name                   = var.cluster_name
  instance_count         = var.instance_count
  ami                    = var.ami_id
  instance_type          = var.gpu_enabled ? var.instance_type_gpu : var.instance_type
  vpc_security_group_ids = [module.security_group.this_security_group_id]
  spot_price             = var.spot_price
  monitoring             = true

  tags = {
    Terraform = "true"
  }
}
