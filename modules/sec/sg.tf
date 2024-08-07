resource "aws_security_group" "this" {
  name        = "${var.common_tags.Project}-${var.common_tags.Environment}-sg"
  description = "Security group with ingress on ports 32581 and 443"
  vpc_id      = var.vpc_id

  ingress {
    description = "mygoapp-NodePort"
    from_port   = 32581
    to_port     = 32581
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "https"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "http"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.common_tags
}
