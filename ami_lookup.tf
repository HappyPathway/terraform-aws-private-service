data "aws_ami" "service_ami" {
  most_recent      = true
  executable_users = ["self"]

  filter {
    name   = "name"
    values = ["${var.service_name}*"]
  }

  name_regex = "^${var.service_name}-\\d{3}"
  owners     = ["self"]
}