variable "secret_name" {
  description = "Name of the secret in AWS Secrets Manager"
  type        = string
}

variable "secret_values" {
  description = "Map of key-value pairs to store in the secret"
  type        = map(string)
  sensitive   = true
}

variable "tags" {
  description = "A map of tags to add to the secret"
  type        = map(string)
  default     = {}
}
