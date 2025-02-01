variable "vpc_id" {
  type = string
}

variable "autoscaling_group_id" {
  type = string
}

variable "security_group_id" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}
