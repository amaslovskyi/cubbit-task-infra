resource "aws_instance" "this" {
  ami           = var.ami_id
  instance_type = var.instance_type

  vpc_security_group_ids = var.security_group_ids
  subnet_id              = var.subnet_id
  iam_instance_profile   = var.iam_instance_profile

  user_data = <<-EOF
              #!/bin/bash
              curl -sfL https://get.k3s.io | sh - --tls-san mygoappcluster.maslovskyi.dev --node-name k3s-cluster
              EOF

  tags = merge(
    var.common_tags,
    {
      Name = "${var.common_tags.Project}-${var.common_tags.Environment}-instance"
    }
  )
}

resource "aws_eip" "this" {
  # domain   = "vpc"
  instance = aws_instance.this.id

  tags = merge(
    var.common_tags,
    {
      Name = "${var.common_tags.Project}-${var.common_tags.Environment}-eip"
    }
  )
}
