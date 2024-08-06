resource "aws_instance" "this" {
  ami           = var.ami_id
  instance_type = var.instance_type

  vpc_security_group_ids = var.security_group_ids
  subnet_id              = var.subnet_id
  iam_instance_profile   = var.iam_instance_profile

  tags = merge(
    var.common_tags,
    {
      Name = "${var.common_tags.Project}-${var.common_tags.Environment}-instance"
    }
  )
}
