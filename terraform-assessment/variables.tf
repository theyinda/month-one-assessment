variable "aws_region" {
  type    = string
  default = "us-east-1"
}
variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}
variable "public_subnet_1_cidr" {
  type    = string
  default = "10.0.1.0/24"
}
variable "public_subnet_2_cidr" {
  type    = string
  default = "10.0.2.0/24"
}
variable "private_subnet_1_cidr" {
  type    = string
  default = "10.0.3.0/24"
}
variable "private_subnet_2_cidr" {
  type    = string
  default = "10.0.4.0/24"
}
variable "availability_zone_1" {
  type    = string
  default = "us-east-1a"
}
variable "availability_zone_2" {
  type    = string
  default = "us-east-1b"
}
variable "bastion_instance_type" {
  type    = string
  default = "t3.micro"
}
variable "web_instance_type" {
  type    = string
  default = "t3.micro"
}
variable "db_instance_type" {
  type    = string
  default = "t3.small"
}
variable "key_pair_name" {
  type = string
}
variable "my_ip_address" {
  type = string
}
variable "web_server_password" {
  type      = string
  sensitive = true
}
