variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "common_tags" {
  description = "Common tags to be applied to all resources"
  type        = map(string)
}
