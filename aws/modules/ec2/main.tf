resource "aws_key_pair" "ec2_key" {
  key_name   = "ec2_key"  # Change this to your preferred key name
  public_key = file("~/.ssh/id_rsa.pub")  # Path to your public key file
}
resource "aws_instance" "ec2_instance" {
  ami = var.ami
  instance_type = var.instance_type
  vpc_security_group_ids = [var.security_group_id]
  subnet_id  = var.subnet_id
  key_name = var.key_name
  associate_public_ip_address = var.associate_public_ip_address
  iam_instance_profile = var.iam_instance_profile  # Add this line to use the variable
  tags = var.ec2_tags
}

output "ec2_instance_id" {
  value = aws_instance.ec2_instance.id
}

output "ec2_private_ip" {
  value = aws_instance.ec2_instance.private_ip
}
