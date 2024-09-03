output "secret_arn" {
  description = "ARN of the created secret"
  value       = aws_secretsmanager_secret.mygoapp_secret.arn
}

output "secret_name" {
  description = "Name of the created secret"
  value       = aws_secretsmanager_secret.mygoapp_secret.name
}
