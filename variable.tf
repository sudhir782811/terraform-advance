variable "vpc_region" {
  type    = "string"
  default = "eu-central-1"
}

variable "vpc_cidr" {
    type = "string"
    default = "192.168.0.0/16"
}

variable "vpc_tags" {
    type = "string"
    default = "dev-vpc"
}