locals {
  bucket_name = "quiz-server-tf"
  table_name  = "quiz-server-tf-table"

  ecr_repo_name = "248919602463.dkr.ecr.eu-west-2.amazonaws.com/quiz-ecr-repo"

  quiz_cluster_name            = "quiz-cluster"
  availability_zones           = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]
  quiz_task_family             = "quiz-task"
  container_port               = 8080
  ecs_task_execution_role_name = "quiz-task-execution-role"

  application_load_balancer_name = "quiz-app-alb"
  target_group_name              = "quiz-alb-tg"

  quiz_db_service_name        = "quiz-db-service"
  quiz_db_task_name           = "quiz-db-task"
  quiz_sb_server_service_name = "quiz-sb-server-service"
  quiz_sb_server_task_name    = "quiz-sb-server-task"
}