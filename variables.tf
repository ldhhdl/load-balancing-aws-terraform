variable "region" {
  type    = string
  default = "us-east-1"
}

variable "namespace" {
  type = string
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "min_instances" {
  type    = number
  default = 1
  validation {
    condition     = var.min_instances <= var.desired_instances
    error_message = "Minimum instances must be less than or equal to desired instances"
  }
}

variable "max_instances" {
  type    = number
  default = 3
}

variable "desired_instances" {
  type    = number
  default = 2
  validation {
    condition     = var.desired_instances <= var.max_instances
    error_message = "Desired instances must be less than or equal to maximum instances"
  }
}
