resource "aws_iam_instance_profile" "ssm_profile" {
  name = "${var.common_tags.Project}-${var.common_tags.Environment}-ssm-profile"
  role = aws_iam_role.ssm_role.name
}

resource "aws_iam_role" "ssm_role" {
  name = "${var.common_tags.Project}-${var.common_tags.Environment}-ssm-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "ssm_policy" {
  role       = aws_iam_role.ssm_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}
