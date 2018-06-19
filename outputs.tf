output "elb_security_group" {
  value = "aws_security_group.elb.id"
}

output "private_dns" {
  value = "${aws_elb.service.dns_name}"
}
