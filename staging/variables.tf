variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "AWS_ACCESS_KEY_ID" {
  description = "AWS access key id"
  type        = string
  default     = ""
}

variable "AWS_SECRET_ACCESS_KEY" {
  description = "AWS secret key"
  type        = string
  default     = ""
}

variable "project" {
  description = "Project name"
  type        = string
  default     = ""
}

variable "environment" {
  description = "Environment"
  type        = string
  default     = ""
}

# ec2 moduel
variable "instance_type" {
  description = "Type of EC2 instance"
  type        = string
}

# vpc net-module vars
variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  default     = ""
}

variable "public_subnet_cidrs" {
  description = "List of public subnet CIDR blocks"
  default     = []
}

variable "private_subnet_cidrs" {
  description = "List of private subnet CIDR blocks"
  default     = []
}

variable "availability_zones" {
  description = "List of availability zones"
  default     = []
}

# public key path
variable "public_key" {
  description = "The path to the public key for SSH access"
  type        = string
}
