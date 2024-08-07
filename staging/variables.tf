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
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC7uolfLV01cHFQbDuTDZop7RnYoK1LSeghlGarzIO5NDZO0eNlCqsSogeqD7hJ1fG+Z4C0P34n/6CFDAt1FUYfilgET9DgP5WBM1iTPA8OfTqQpN2ALlTZkFbaohqUW7InkmQ6+p23mcHdaRQoZ1dp+VtnhJGDE3tPQTx107h1awe+PzyIg1fA/ztRkBXZzR5a497D57qVf8HNpziYlmHnD975oKEd3Mcfr8eD1JwcIBp+ptFJSXaDlZ9kGihOIouA88Xjc+nL8aaYkTSfvPZlx5CTj/NKzQPxywhWf5sDhAEpLnIX/FUxoIPfH121PE6a2scflo8PmI2SP9yif/VvL7f9vxRjNnXE51PK7umzJB+MvMOADDJB8lqxj9zARNRwihdcJOQ9ImEy0Ok3CXwaEYJrZd3x8+9fsR14hazCeVZNg9iDH/dsJfsknhCbHzl9mOnUkoFC1v/ethDEkBqpvxcIKf5S/ov8pg09qg0S42we69wabtzofLBkgRfJ58E= Shatten@MacBook-Pro.local"
}
