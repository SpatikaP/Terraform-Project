resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "rds-subnet-group"
  subnet_ids = var.subnet_ids
  tags = var.rds_tags
}

resource "aws_db_instance" "db" {
  identifier = var.identifier
  engine = var.engine
  engine_version = var.engine_version
  instance_class = var.instance_class
  allocated_storage  = var.allocated_storage
  db_name = var.db_name
  username  = var.username
  password  = var.password
  port = var.port
  iam_database_authentication_enabled = var.iam_database_authentication_enabled
  db_subnet_group_name = aws_db_subnet_group.rds_subnet_group.name
  vpc_security_group_ids = [var.security_group_id]
  skip_final_snapshot = true
  # iam_roles = var.rds_iam_roles
  tags = var.rds_tags
}
