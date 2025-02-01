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
}

variable "max_instances" {
  type    = number
  default = 3
}

variable "desired_instances" {
  type    = number
  default = 2
}
