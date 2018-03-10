resource "aws_autoscaling_group" "scalegroup" {
	launch_configuration = "${aws_launch_configuration.service.name}"
	min_size = "${var.min_size}"
	max_size = "${var.max_size}"
	enabled_metrics = ["GroupMinSize", "GroupMaxSize", "GroupDesiredCapacity", "GroupInServiceInstances", "GroupTotalInstances"]
	metrics_granularity="1Minute"
	load_balancers= ["${aws_elb.service.id}"]
	vpc_zone_identifier = ["${aws_subnet.server_subnet.id}"]
	health_check_type="ELB"
	default_cooldown = "${var.default_cooldown}"
	
	name = "${var.company_name}-${var.org_name}-${var.service_name}"
	
	tag {
		key = "service_name"
		value = "${var.service_name}"
		propagate_at_launch = true
	}
	
	tag {
		key = "company_name"
		value = "${var.company_name}"
		propagate_at_launch = true
	}

	tag {
		key = "org_name"
		value = "${var.org_name}"
		propagate_at_launch = true
	}

	tag {
		key = "Name"
		value = "${var.company_name}-${var.org_name}-${var.service_name}"
		propagate_at_launch = true
	}
}