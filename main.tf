module "vpc" {
  source = "./modules/networking"
}

module "security_group" {
  source = "./modules/security_group"
  vpc_id = module.vpc.vpc_id
}

module "autoscaling_group" {
  source            = "./modules/autoscaling_group"
  namespace         = var.namespace
  security_group_id = module.security_group.security_group_id
  min_instances     = var.min_instances
  max_instances     = var.max_instances
  desired_instances = var.desired_instances
  instance_type     = var.instance_type
  subnet_ids        = module.vpc.subnet_ids
}

module "load_balancer" {
  source               = "./modules/load_balancer"
  vpc_id               = module.vpc.vpc_id
  security_group_id    = module.security_group.security_group_id
  subnet_ids           = module.vpc.subnet_ids
  autoscaling_group_id = module.autoscaling_group.autoscaling_group_id
}
