variable "cluster_name" {
  description = "Project Name"
  type        = string
}

variable "tags" {
  description = "Tags for Project"
  type        = map(string)
}

variable "listener_port" {
  description = "Port for ALB to listen on"
  type        = number
}

variable "container_port" {
  description = "Port to forward traffic to"
  type        = number
}

variable "vpc_id" {
  description = "id of vpc to be used"
  type        = string
}