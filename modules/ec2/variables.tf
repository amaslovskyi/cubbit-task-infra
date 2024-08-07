variable "ami_id" {
  description = "The AMI ID to use for the instance"
  type        = string
}

variable "instance_type" {
  description = "The type of instance to start"
  type        = string
  default     = ""
}

variable "iam_instance_profile" {
  description = "The IAM Instance Profile to launch the instance with"
  type        = string
}

variable "security_group_ids" {
  description = "A list of security group IDs to associate with"
  type        = list(string)
}

variable "subnet_id" {
  description = "The VPC Subnet ID to launch in"
  type        = string
}

variable "common_tags" {
  description = "Common tags to be applied to all resources"
  type        = map(string)
}

# public key path
variable "public_key" {
  description = "The path to the public key for SSH access"
  type        = string
}
