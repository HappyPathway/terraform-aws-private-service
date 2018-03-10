variable "region" {
	default = "us-east-1"
}

variable "vpc_cidr" {}
variable "subnet_cidr" {}


variable "service_name" {}
variable "service_port" {}
variable "service_healthcheck" {}
variable "service_access" {
  default = "0.0.0.0/0"
}

variable "ssh_access" {
  default = "60.242.xxx.xxx/32"
}

variable "instance_type" {}
variable "company_name" {}
variable "org_name" {}


variable "key_name" {}

variable "image_id" {
  default = "ami-43a15f3e"
}

variable "min_size" {
  default = 1
} 

variable  "max_size" {
  default = 3
}