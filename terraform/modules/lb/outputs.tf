output "application_url" {
  value       = "http://${module.alb.dns_name}"
  description = "Copy this value in your browser in order to access the deployed app"
}

output "alb_target_group_arn" {
  value       = module.alb.target_groups["ecs-task"].arn
  description = "Target group arn"
}

output "alb_security_group_id" {
  value       = module.alb.security_group_id
  description = "security group id of load balancer"
}