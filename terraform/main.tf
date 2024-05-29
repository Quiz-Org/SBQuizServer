provider "aws" {
  region = local.region
}

data "aws_availability_zones" "available" {}

locals {
  cluster_name = "quiz-server"
  region       = "eu-west-2"

  vpc_cidr       = "10.0.0.0/16"
  azs            = slice(data.aws_availability_zones.available.names, 0, 3)
  namespace_name = "default.${local.cluster_name}.local"

  tags = {
    Blueprint  = local.cluster_name
    GithubRepo = "github.com/FegrusB/SBQuizServer"
  }

  container_registry = "fegrus/"

  db_name           = "quiz-db"
  db_container_port = 3306

  sb_name = "quiz-sb-server"


  sb_container_port = 8080

}

module "core-infra" {
  source = "./modules/core-infra"

  name = local.cluster_name
  tags = local.tags

  azs            = local.azs
  vpc_cidr       = local.vpc_cidr
  namespace_name = local.namespace_name
}

module "db-service" {
  source = "./modules/db-service"

  container_name     = local.db_name
  container_registry = local.container_registry
  cluster_name       = module.core-infra.cluster_name
  namespace_name     = module.core-infra.service_discovery_namespaces.name

  region         = local.region
  vpc_id         = module.core-infra.vpc_id
  container_port = local.db_container_port

  tags = local.tags
}

module "lb" {
  source       = "./modules/lb"
  cluster_name = local.cluster_name
  tags         = local.tags

  container_port = local.sb_container_port
  listener_port  = local.sb_container_port
  vpc_id         = module.core-infra.vpc_id
}

module "sb-service" {
  source = "./modules/sb-service"

  container_name     = local.sb_name
  container_registry = local.container_registry
  cluster_name       = module.core-infra.cluster_name
  namespace_name     = module.core-infra.service_discovery_namespaces.name
  region             = local.region
  tags               = local.tags

  container_port = local.sb_container_port
  db_name        = local.db_name
  db_port        = local.db_container_port

  lb_security_group_id = module.lb.alb_security_group_id
  lb_target_group_arn  = module.lb.alb_target_group_arn
  vpc_id               = module.core-infra.vpc_id
}