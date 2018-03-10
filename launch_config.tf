resource "aws_launch_configuration" "service" {
	image_id= "${data.aws_ami.service_ami.image_id}"
	instance_type = "${var.instance_type}"
	security_groups = ["${aws_security_group.service.id}"]
	key_name = "${var.key_name}"

	lifecycle {
		create_before_destroy = true
	}
}
