terraform {
  backend "s3" {
    bucket         = "quiz-server-tf-backend"
    key            = "tf-infra/terraform.tfstate"
    region         = "eu-west-2"
    dynamodb_table = "quiz-server-tf-backend"
    encrypt        = true
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

module "ecrRepo" {
  source        = "./modules/ecr"

  ecr_repo_name = local.ecr_repo_name
}

module "ecsCluster" {
  source = "./modules/ecs"

  quiz_cluster_name              = local.quiz_cluster_name
  availability_zones             = local.availability_zones

  quiz_task_family               = local.quiz_task_family
  ecr_repo_url                   = module.ecrRepo.repository_url

  container_port                 = local.container_port
  ecs_task_execution_role_name   = local.ecs_task_execution_role_name

  quiz_db_task_name              = local.quiz_db_task_name
  quiz_sb_server_task_name       = local.quiz_sb_server_task_name

  application_load_balancer_name = local.application_load_balancer_name
  target_group_name              = local.target_group_name
  quiz_db_service_name           = local.quiz_db_service_name
  quiz_sb_server_service_name    = local.quiz_sb_server_service_name

}