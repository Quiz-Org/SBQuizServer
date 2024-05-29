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
}
