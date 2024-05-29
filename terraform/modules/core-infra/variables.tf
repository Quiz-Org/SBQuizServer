variable "name" {
  description = "Project Name"
  type        = string
}

variable "tags" {
  description = "Tags for Project"
  type        = map(string)
}

variable "vpc_cidr" {
  description = "cidr block for VPC"
  type        = string
}

variable "azs" {
  description = "Availability Zones to be used"
  type        = list(string)
}

variable "namespace_name" {
  description = "Name for Service Discovery Namespace"
  type        = string
}