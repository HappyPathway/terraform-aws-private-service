resource "aws_autoscaling_group" "scalegroup" {
	launch_configuration = "${aws_launch_configuration.service.name}"
	min_size = 1
	max_size = 4
	enabled_metrics = ["GroupMinSize", "GroupMaxSize", "GroupDesiredCapacity", "GroupInServiceInstances", "GroupTotalInstances"]
	metrics_granularity="1Minute"
	load_balancers= ["${aws_elb.service.id}"]
	vpc_zone_identifier = ["${aws_subnet.server_subnet.id}"]
	health_check_type="ELB"
	tag {
		key = "role"
		value = "${var.service_name}"
		propagate_at_launch = true
	}
}