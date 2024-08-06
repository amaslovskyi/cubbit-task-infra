terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "maslovskyi-edu"
    workspaces {
      name = "prod-cubbit-task-infra"
    }
  }
}

provider "aws" {
  region = var.region
}

data "aws_caller_identity" "current" {}

locals {
  common_tags = {
    Project     = var.project
    Environment = var.environment
    Terraform   = true
  }
}

module "ec2_instance" {
  source = "./modules/ec2"

  ami_id               = data.aws_ami.amazonlinux_2023.id
  instance_type        = var.instance_type
  security_group_ids   = module.security_group.security_group_id
  subnet_id            = module.vpc.public_subnet_ids[0]
  iam_instance_profile = module.security_group.instance_profile_id

  common_tags = local.common_tags
}

## extract AMI
data "aws_ami" "amazonlinux_2023" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }
}

module "vpc" {
  source = "./modules/net"

  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  availability_zones   = var.availability_zones

  common_tags = local.common_tags
}

module "security_group" {
  source = "./modules/sec"

  vpc_id      = module.vpc.vpc_id
  common_tags = local.common_tags
}
