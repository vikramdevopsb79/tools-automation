resource "aws_iam_role" "main" {
  name = "${var.name}-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
  # A role is created for tool to communicate with AWS

  inline_policy {
    name = "inline-policy"

    policy = jsonencode({
      Version = "2012-10-17"
      Statement = [
        {
          Action   = concat(var.dummy_policy, var.policy_actions)
          Effect   = "Allow"
          Resource = "*"
        },
      ]
    })
  }

  tags = {
    Name = "${var.name}-role"
  }
}

# Policies are attached to the role to access the resources

#to create instance ARN for ec2 we added this for that role
resource "aws_iam_instance_profile" "main" {
  name = "${var.name}-role"
  role = aws_iam_role.main.name
}