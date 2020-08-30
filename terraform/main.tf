provider "aws" {
  region = var.aws_region
}

module "key_pair" {
  source          = "./modules/key_pair"
  create_key_pair = true
  key_name        = "mykey"
}

module "vpc" {
  source = "github.com/terraform-aws-modules/terraform-aws-vpc"

  name = var.project
  cidr = "10.1.0.0/16"

  azs             = ["${var.aws_region}a"]
  private_subnets = ["10.1.1.0/24"]
  public_subnets  = ["10.1.101.0/24"]

  enable_nat_gateway   = true
  enable_dns_hostnames = true
  enable_dns_support   = true
  enable_dhcp_options  = true
  single_nat_gateway   = true

  tags = {
    Environment = var.environment
    Name        = var.project
    Project     = var.project
    Role        = "VPC"
  }
}
