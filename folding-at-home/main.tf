provider "aws" {
  region = var.aws_region
}

data "aws_vpc" "default" {
  default = true
}

data "aws_subnet_ids" "all" {
  vpc_id = "${data.aws_vpc.default.id}"
}

data "aws_ami" "linux_ami" {
  most_recent = true

  filter {
    name = "name"

    values = [
      "amzn-ami-hvm-*-x86_64-gp2",
    ]
  }

  filter {
    name = "owner-alias"

    values = [
      "amazon",
    ]
  }
}

data "aws_ami" "gpu_enabled_ami" {
  most_recent = true
  filter {
    name = "name"

    values = [
      "NVIDIA Deep Learning AMI-*",
    ]
  }
}



module "security_group" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "example"
  description = "Security group"
  vpc_id      = "${data.aws_vpc.default.id}"

  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["http-80-tcp", "all-icmp"]
  egress_rules        = ["all-all"]
}

resource "aws_key_pair" "sshkey" {
  key_name   = "folding-at-home-key"
  public_key = var.public_key
}

module "ec2_spot_cluster" {
  source                 = "httpdss/ec2-spot-instance/aws"
  name                   = var.cluster_name
  instance_count         = var.instnace_count
  ami                    = var.ami_id
  instance_type          = var.gpu_enabled ? var.instance_type_gpu : var.instance_type
  key_name               = aws_key_pair.sshkey.key_name
  vpc_security_group_ids = [module.security_group.this_security_group_id]
  spot_price             = var.spot_price
  monitoring             = true

  tags = {
    Terraform = "true"
  }
}
