variable "region" {
  type    = string
  default = "eu-west-2"
}

variable "avail_zones" {
  type    = list(string)
  default = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]
}
