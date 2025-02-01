variable "namespace" {
    type = string
}

variable "instance_type" {
    type = string
    default = "t2.micro"
}

variable "desired_instances" {
    type = number
    default = 2
}

variable "max_instances" {
    type = number
    default = 3
}

variable "min_instances" {
    type = number
    default = 1
}
