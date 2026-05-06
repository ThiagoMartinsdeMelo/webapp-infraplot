variable "name" { type = string }
variable "engine" { default = "mysql" }
variable "engine_version" { default = "8.0" }
variable "instance_class" { default = "db.t3.micro" }
variable "db_name" {
  type    = string
  default = ""
}
variable "username" {
  type    = string
  default = "admin"
}
variable "allocated_storage" { default = 20 }
variable "storage_type" { default = "gp3" }
variable "iops" {
  type    = number
  default = 0
}
variable "max_allocated_storage" {
  type    = number
  default = 0
}
variable "password" {
  sensitive = true
  default   = "ChangeMe123!"
}
variable "multi_az" {
  type    = bool
  default = false
}
variable "backup_retention_period" {
  type    = number
  default = 7
}
variable "backup_window" {
  type    = string
  default = "03:00-04:00"
}
variable "maintenance_window" {
  type    = string
  default = "sun:03:00-sun:04:00"
}
variable "deletion_protection" {
  type    = bool
  default = false
}
variable "publicly_accessible" {
  type    = bool
  default = false
}
variable "performance_insights_enabled" {
  type    = bool
  default = false
}
variable "subnet_ids" {
  type    = list(string)
  default = []
}
variable "environment" { type = string }
variable "tags" {
  type    = map(string)
  default = {}
}
variable "vpc_security_group_ids" {
  type    = list(string)
  default = []
}