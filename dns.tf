data "aws_route53_zone" "selected" {
  name         = "${var.domain}"
  # private_zone = true
  vpc_id = "${var.vpc_id}"
}

resource "aws_route53_record" "service" {
  zone_id = "${data.aws_route53_zone.selected.zone_id}"
  name    = "${var.service_name}.${var.domain}"
  type    = "CNAME"
  ttl     = "300"
  records = ["${aws_elb.service.dns_name}"]
}
