resource "aws_elb" "service" {
	name = "${var.service_name}"
	subnets = ["${aws_subnet.server_subnet.id}"]
	security_groups = ["${aws_security_group.elb.id}"]
	access_logs {
		bucket = "${var.company_name}-${var.org_name}-access-logs"
		bucket_prefix = "${var.service_name}"
		interval = 5
	}

	listener {
		instance_port = "${var.service_port}"
		instance_protocol = "http"
		lb_port = "${var.service_port}"
		lb_protocol = "http"
	}

	health_check {
		healthy_threshold = 2
		unhealthy_threshold = 2
		timeout = 3
		target = "HTTP:${var.service_port}/${var.service_healthcheck}"
		interval = 30
	}

	cross_zone_load_balancing = true
	idle_timeout = 400
	connection_draining = true
	connection_draining_timeout = 400

	tags {
		Name = "${var.service_name}-elb"
	}
}


resource "aws_lb_cookie_stickiness_policy" "cookie_stickness" {
	name = "cookiestickness"
	load_balancer = "${aws_elb.service.id}"
	lb_port = 80
	cookie_expiration_period = 600
}
