# # global variables for project
project     = "mygoapp"
environment = "prod"
region      = "us-east-1"

## EC2 vars
instance_type = "t4g.medium"

## Net VPC vars
vpc_cidr             = "10.0.0.0/16"
public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]
availability_zones   = ["us-east-1a", "us-east-1b"]
