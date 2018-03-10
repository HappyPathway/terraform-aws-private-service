resource "aws_cloudwatch_metric_alarm" "cpualarm" {
	alarm_name = "${var.company_name}-${var.org_name}-${var.service_name}-cpu_up"
	comparison_operator = "GreaterThanOrEqualToThreshold"
	evaluation_periods = 2
	metric_name = "CPUUtilization"
	namespace = "AWS/EC2"
	period = 120
	statistic = "Average"
	threshold = 60

	dimensions {
		AutoScalingGroupName = "${aws_autoscaling_group.scalegroup.name}"
	}

	alarm_description = "This metric monitor EC2 instance cpu utilization"
	alarm_actions = ["${aws_autoscaling_policy.autopolicy.arn}"]
}

resource "aws_cloudwatch_metric_alarm" "cpualarm-down" {
	alarm_name = "${var.company_name}-${var.org_name}-${var.service_name}-cpu_down"
	comparison_operator = "LessThanOrEqualToThreshold"
	evaluation_periods = 2
	metric_name = "CPUUtilization"
	namespace = "AWS/EC2"
	period = 120
	statistic = "Average"
	threshold = 10

	dimensions {
		AutoScalingGroupName = "${aws_autoscaling_group.scalegroup.name}"
	}

	alarm_description = "This metric monitor EC2 instance cpu utilization"
	alarm_actions = ["${aws_autoscaling_policy.autopolicy-down.arn}"]
}
