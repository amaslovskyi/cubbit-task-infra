resource "aws_key_pair" "this" {
  key_name   = "${var.common_tags.Project}-${var.common_tags.Environment}-key"
  public_key = var.public_key
}

resource "aws_instance" "this" {
  ami           = var.ami_id
  instance_type = var.instance_type

  vpc_security_group_ids = var.security_group_ids
  subnet_id              = var.subnet_id
  iam_instance_profile   = var.iam_instance_profile
  key_name               = aws_key_pair.this.key_name

  user_data = <<-EOF
              #!/bin/bash
              dnf update -y
              dnf install -y container-selinux
              dnf install -y https://rpm.rancher.io/k3s/stable/common/centos/8/noarch/k3s-selinux-1.1-1.el8.noarch.rpm
              curl -sfL https://get.k3s.io | sh -s - --tls-san mygoappcluster.maslovskyi.dev --node-name k3s-cluster
              EOF

  tags = merge(
    var.common_tags,
    {
      Name = "${var.common_tags.Project}-${var.common_tags.Environment}-instance"
    }
  )
}
