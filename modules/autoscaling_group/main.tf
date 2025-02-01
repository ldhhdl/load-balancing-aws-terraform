resource "aws_launch_template" "launch_template" {
  name_prefix   = var.namespace
  image_id      = "ami-0c614dee691cbbf37"
  instance_type = var.instance_type
  user_data = filebase64("${path.module}/asg_user_data.sh")
}

resource "aws_autoscaling_group" "autoscaling_group" {
  availability_zones = ["us-east-1a"]   # TODO: Make this random or configurable
  desired_capacity = var.desired_instances 
  max_size = var.max_instances
  min_size = var.min_instances

  launch_template {
    id      = aws_launch_template.launch_template.id
    version = "$Latest"
  }
}
