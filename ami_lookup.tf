data "aws_ami" "service_ami" {
  filter {
    name   = "state"
    values = ["available"]
  }

  filter {
    name   = "tag:company_name"
    values = ["${var.company_name}"]
  }

  filter {
    name   = "tag:service_name"
    values = ["${var.service_name}"]
  }

  filter {
    name   = "tag:org_name"
    values = ["${var.org_name}"]
  }

  most_recent = true
}
