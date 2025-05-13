data "aws_iam_policy_document" "instance_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]
    
    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

resource "aws_iam_policy" "policy_one" {
  name = "policy-618033"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action   = var.ssm_policy
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

resource "aws_iam_policy" "policy_two" {
  name = "policy-381966"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action   = var.s3_policy
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })

  tags = var.iam_tags
}

resource "aws_iam_role" "ec2_role" {
  name               = "ec2_role"
  assume_role_policy = data.aws_iam_policy_document.instance_assume_role_policy.json 
  managed_policy_arns = [aws_iam_policy.policy_one.arn, aws_iam_policy.policy_two.arn]
  tags = var.iam_tags

}

resource "aws_iam_instance_profile" "ec2_instance_profile" {
  name = "ec2_instance_profile"
  role = aws_iam_role.ec2_role.name
}

output "ec2_instance_profile_name" {
  value = aws_iam_instance_profile.ec2_instance_profile.name
}





# # Create an IAM policy document for RDS to assume the role
# data "aws_iam_policy_document" "rds_assume_role_policy" {
#   statement {
#     actions = ["sts:AssumeRole"]

#     principals {
#       type        = "Service"
#       identifiers = ["rds.amazonaws.com"]
#     }
#   }
# }
# # Create the first IAM policy for RDS
# resource "aws_iam_policy" "rds_policy_one" {
#   name = "rds-policy-381966"

#   policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Action   = var.s3_policy
#         Effect   = "Allow"
#         Resource = "*"
#       },
#     ]
#   })

#   # tags = var.iam_rds_tags
# }
# # Create the IAM Role for RDS
# resource "aws_iam_role" "rds_role" {
#   name               = "rds_role"
#   assume_role_policy = data.aws_iam_policy_document.rds_assume_role_policy.json
#   managed_policy_arns = [aws_iam_policy.rds_policy_one.arn]
# }
# # Output the IAM Role name associated with RDS
# output "rds_role_name" {
#   value = aws_iam_role.rds_role.name
# }
# # Output the IAM Role ARN associated with RDS
# output "rds_role_arn" {
#   value = aws_iam_role.rds_role.arn
# }





















# resource "aws_iam_role" "ec2_role" {
#   name = "ec2_role"

#   assume_role_policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [{
#       Action    = "sts:AssumeRole"
#       Principal = {
#         Service = "ec2.amazonaws.com"
#       }
#       Effect    = "Allow"
#       Sid       = ""
#     }]
#   })

#   tags = var.iam_tags
# }

# resource "aws_iam_policy" "ec2_policy" {
#   name        = "ec2_policy"
#   description = "IAM policy for EC2 instance"

#   policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Action = var.s3_policy
#         Effect   = "Allow"
#         Resource = "*"
#       },
#       {
#         Action = var.ssm_policy
#         Effect = "Allow"
#         Resource = "*"
#       }
#     ]
#   })

#   tags = var.iam_tags
# }

# resource "aws_iam_instance_profile" "ec2_instance_profile" {
#   name = "ec2_instance_profile"
#   role = aws_iam_role.ec2_role.name
# }

# output "ec2_instance_profile_arn" {
#   value = aws_iam_instance_profile.ec2_instance_profile.arn 
# }
