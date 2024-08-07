output "security_group_id" {
  description = "The ID of the security group"
  value       = aws_security_group.this.id
}

output "k3s_security_group_id" {
  value = aws_security_group.k3s.id
}

output "instance_profile_id" {
  description = "The ID of the IAM instance profile"
  value       = aws_iam_instance_profile.ssm_profile.id
}
