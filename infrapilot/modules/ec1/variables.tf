variable "name" { type = string }
variable "ami" { default = "ami-0c55b159cbfafe1f0" }
variable "instance_type" { default = "t3.micro" }
variable "tenancy" { default = "default" }
variable "monitoring" {
  type    = bool
  default = false
}
variable "user_data" { default = "" }
variable "user_data_file" {
  type        = string
  default     = ""
  description = "Caminho para script .sh (filebase64). Tem precedência sobre user_data."
}
variable "termination_protection" {
  type    = bool
  default = false
}
variable "root_volume_size" {
  type    = number
  default = 20
}
variable "root_volume_type" { default = "gp3" }
variable "root_volume_iops" {
  type    = number
  default = 3000
}
variable "root_volume_throughput" {
  type    = number
  default = 125
}
variable "root_volume_encrypted" {
  type    = bool
  default = false
}
variable "subnet_id" {
  type    = string
  default = ""
}
variable "use_spot" {
  type    = bool
  default = false
}
variable "vpc_security_group_ids" {
  type    = list(string)
  default = []
}
variable "environment" { type = string }
variable "tags" {
  type    = map(string)
  default = {}
}