resource "aws_secretsmanager_secret" "mygoapp_secret" {
  name        = var.secret_name
  description = "Secret for mygoapp"

  tags = var.tags
}

resource "aws_secretsmanager_secret_version" "mygoapp_secret_version" {
  secret_id     = aws_secretsmanager_secret.mygoapp_secret.id
  secret_string = jsonencode(var.secret_values)
}
