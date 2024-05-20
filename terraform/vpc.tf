resource "aws_vpc" "terraformTest" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "TerraformTest"
    Project = "Testing Terraform"
  }
}