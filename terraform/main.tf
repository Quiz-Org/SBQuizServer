terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }

  }
}

provider "aws" {
  region = "eu-west-2"
}

resource "aws_vpc" "terraformTest" {
  cidr_block = "10.0.0.0/16"
}