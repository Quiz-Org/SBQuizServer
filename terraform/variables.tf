variable "region" {
  type    = string
  default = "eu-west-2"
}

variable "avail_zones" {
  type    = list(string)
  default = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]
}

variable "vpc_cidr" {
  description = "CIDR for VPC"
  type        = string
}

output "vpc_id" {
  value = "aws_vpc.TerraformTest.id"
}

variable "vpc_tags" {
  description = "Tags for VPC"
  type        = map(any)
}