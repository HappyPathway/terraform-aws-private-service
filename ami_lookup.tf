data "aws_ami" "service_ami" {
  most_recent      = true
  executable_users = ["self"]

  filter {
    name   = "name"
    values = ["${var.company_name}-${var.org_name}-${var.service_name}"]
  }

  name_regex = "${var.company_name}-${var.org_name}-${var.service_name}"
  owners     = ["self"]
}