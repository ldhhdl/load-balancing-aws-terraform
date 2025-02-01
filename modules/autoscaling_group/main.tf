resource "aws_launch_template" "launch_template" {
  name_prefix   = var.namespace
  image_id      = "ami-0c614dee691cbbf37"
  instance_type = var.instance_type
  user_data = filebase64("${path.module}/asg_user_data.sh")
  vpc_security_group_ids = [var.security_group_id]
}

resource "aws_autoscaling_group" "autoscaling_group" {
  vpc_zone_identifier = [var.subnet_id]
  desired_capacity = var.desired_instances 
  max_size = var.max_instances
  min_size = var.min_instances

  launch_template {
    id      = aws_launch_template.launch_template.id
    version = "$Latest"
  }
}
