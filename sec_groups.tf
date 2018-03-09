resource "aws_security_group" "service" {
	name = "${var.service_name}-nodes"
	ingress {
		from_port = "${var.service_port}"
		to_port = "${var.service_port}"
		protocol = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
	}

	lifecycle {
		create_before_destroy = true
	}
}

resource "aws_security_group_rule" "ssh" {
	security_group_id = "${aws_security_group.service.id}"
	type = "ingress"
	from_port = 22
	to_port = 22
	protocol = "tcp"
	cidr_blocks = ["${var.ssh_access}"]
}

resource "aws_security_group" "elb" {
	name = "${var.service_name}-elb"
	ingress {
		from_port = "${var.service_port}"
		to_port = "${var.service_port}"
		protocol = "tcp"
		cidr_blocks = ["${var.service_access}"]
	}

	egress {
		from_port = 0
		to_port = 0
		protocol = "-1"
		cidr_blocks = ["0.0.0.0/0"]
	}

	lifecycle {
		create_before_destroy = true
	}
}
