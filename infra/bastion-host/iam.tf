resource "aws_iam_instance_profile" "resources-iam-profile" {
  name = "bastion_profile"
  role = aws_iam_role.resources-iam-role.name
}
resource "aws_iam_role" "resources-iam-role" {
  name               = "ssm-role"
  description        = "The role for the developer resources EC2"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": {
    "Effect": "Allow",
    "Principal": {"Service": "ec2.amazonaws.com"},
    "Action": "sts:AssumeRole"
  }
}
EOF
}
resource "aws_iam_role_policy_attachment" "resources-ssm-policy" {
  role       = aws_iam_role.resources-iam-role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}