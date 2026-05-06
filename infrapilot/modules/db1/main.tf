resource "aws_db_subnet_group" "this" {
  count       = length(var.subnet_ids) > 0 ? 1 : 0
  name        = replace(lower(var.name), "_", "-")
  subnet_ids  = var.subnet_ids
  tags        = merge(var.tags, { Name = var.name, Environment = var.environment })
}

resource "aws_db_instance" "this" {
  identifier                   = replace(lower(var.name), "_", "-")
  engine                       = var.engine
  engine_version               = var.engine_version
  instance_class               = var.instance_class
  db_name                      = var.db_name != "" ? var.db_name : null
  allocated_storage            = var.allocated_storage
  storage_type                 = var.storage_type
  iops                         = var.iops > 0 ? var.iops : null
  max_allocated_storage        = var.max_allocated_storage > 0 ? var.max_allocated_storage : null
  password                     = var.password
  username                     = var.username
  multi_az                     = var.multi_az
  vpc_security_group_ids       = var.vpc_security_group_ids
  db_subnet_group_name         = length(var.subnet_ids) > 0 ? aws_db_subnet_group.this[0].name : null
  backup_retention_period      = var.backup_retention_period
  backup_window                = var.backup_window
  maintenance_window           = var.maintenance_window
  deletion_protection          = var.deletion_protection
  publicly_accessible          = var.publicly_accessible
  performance_insights_enabled = var.performance_insights_enabled
  skip_final_snapshot          = true
  tags = merge(var.tags, { Name = var.name, Environment = var.environment })
}