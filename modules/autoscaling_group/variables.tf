variable "namespace" {
    type = string
}

variable "instance_type" {
    type = string
}

variable "desired_instances" {
    type = number
}

variable "max_instances" {
    type = number
}

variable "min_instances" {
    type = number
}

variable "security_group_id" {
    type = string
}

variable "subnet_id" {
    type = string
}
