variable "container_name" {
  description = "Name of Container"
  type        = string
}

variable "cluster_name" {
  description = "Cluster Name"
  type        = string
}

variable "tags" {
  description = "Tags for Project"
  type        = map(string)
}

variable "namespace_name" {
  description = "Name for Service Discovery Namespace"
  type        = string
}

variable "region" {
  description = "Region to be deployed in"
  type        = string
}

variable "vpc_id" {
  description = "id of vpc to be used"
  type        = string
}

variable "container_registry" {
  description = "Registry to fetch Container from"
  type        = string
}

variable "container_port" {
  description = "Port to be used by Container"
  type        = number
}

variable "db_name" {
  description = "name of db service for service connect"
  type        = string
}

variable "db_port" {
  description = "port for db connection"
  type        = number
}

variable "lb_target_group_arn" {
  description = "arn for load balancer target group"
  type        = string
}

variable "lb_security_group_id" {
  description = "security group id for load balancer target group"
  type        = string
}