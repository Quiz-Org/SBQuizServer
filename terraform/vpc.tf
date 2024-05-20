resource "aws_vpc" "terraformTest" {
  cidr_block = var.vpc_cidr
  tags       = var.vpc_tags
}