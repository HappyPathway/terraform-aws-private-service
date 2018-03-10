resource "aws_autoscaling_policy" "autopolicy" {
	name = "${var.company_name}-${var.org_name}-${var.service_name}-autoplicy-up"
	scaling_adjustment = 1
	adjustment_type = "ChangeInCapacity"
	cooldown = 300
	autoscaling_group_name = "${aws_autoscaling_group.scalegroup.name}"
}

resource "aws_autoscaling_policy" "autopolicy-down" {
  name = "${var.company_name}-${var.org_name}-${var.service_name}-autoplicy-down"
  scaling_adjustment = -1
  adjustment_type = "ChangeInCapacity"
  cooldown = 300
  autoscaling_group_name = "${aws_autoscaling_group.scalegroup.name}"
}