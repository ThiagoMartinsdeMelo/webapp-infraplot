resource "aws_instance" "this" {
  ami                     = var.ami
  instance_type           = var.instance_type
  subnet_id               = var.subnet_id
  tenancy                 = var.tenancy
  monitoring              = var.monitoring
  user_data_base64        = var.user_data_file != "" ? filebase64(var.user_data_file) : (var.user_data != "" ? base64encode(var.user_data) : null)
  disable_api_termination = var.termination_protection
  vpc_security_group_ids  = var.vpc_security_group_ids

  dynamic "instance_market_options" {
    for_each = var.use_spot ? [1] : []
    content { market_type = "spot" }
  }

  iam_instance_profile = aws_iam_instance_profile.this.name

  root_block_device {
    volume_size = var.root_volume_size
    volume_type = var.root_volume_type
    encrypted   = var.root_volume_encrypted
    iops        = var.root_volume_iops
    throughput  = var.root_volume_throughput
  }

  tags = merge(var.tags, { Name = var.name, Environment = var.environment })
}
resource "aws_iam_instance_profile" "this" { name = "profile-${var.name}" }
resource "aws_iam_role" "this" {
  name               = "role-${var.name}"
  assume_role_policy = jsonencode({
    Version   = "2012-10-17"
    Statement = [{ Action = "sts:AssumeRole", Effect = "Allow", Principal = { Service = "ec2.amazonaws.com" } }]
  })
}