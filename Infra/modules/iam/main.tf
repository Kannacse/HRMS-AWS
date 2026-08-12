#############################################
# EC2 Assume Role Policy
#############################################

data "aws_iam_policy_document" "ec2_assume_role" {

  statement {

    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }

    actions = [
      "sts:AssumeRole"
    ]
  }
}

#############################################
# IAM Role
#############################################

resource "aws_iam_role" "ec2_role" {

  name               = var.role_name
  assume_role_policy = data.aws_iam_policy_document.ec2_assume_role.json

}

#############################################
# AmazonSSMManagedInstanceCore
#############################################

resource "aws_iam_role_policy_attachment" "ssm" {

  role       = aws_iam_role.ec2_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"

}

#############################################
# ECR Read Only
#############################################

resource "aws_iam_role_policy_attachment" "ecr" {

  role       = aws_iam_role.ec2_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"

}

#############################################
# CloudWatch Agent
#############################################

resource "aws_iam_role_policy_attachment" "cloudwatch" {

  role       = aws_iam_role.ec2_role.name
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"

}

#############################################
# Instance Profile
#############################################

resource "aws_iam_instance_profile" "profile" {

  name = "${var.role_name}-profile"

  role = aws_iam_role.ec2_role.name

}
