module "vpc" {
    source = "./modules/networking"
}

module "security_group" {
    source = "./modules/security_group"
    vpc_id = module.vpc.vpc_id
    vpc_cidr_block = module.vpc.vpc_cidr_block
}

module "autoscaling_group" {
    source = "./modules/autoscaling_group"
    namespace = var.namespace
    security_group_id = module.security_group.security_group_id
    min_instances = var.min_instances
    max_instances = var.max_instances
    desired_instances = var.desired_instances
    instance_type = var.instance_type
}

