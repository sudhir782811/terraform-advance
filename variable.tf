variable "vpc_region" {
  type    = "string"
  default = "eu-central-1"
}

variable "vpc_cidr" {
    type = "string"
    default = "172.16.0.0/16"
}

variable "vpc_tags" {
    type = "string"
    default = "dev-vpc"
}
#variable "subnet_cidrs" {
#   description = "choose cidr for subnets"
#    type = "list"
#    default = ["192.168.0.0/24", "192.168.10.0/24"]
#}

variable "private_subnet_cidrs" {
  type    = "list"
  default = ["172.16.5.0/24", "172.16.6.0/24"]
}

variable "availability_zones" {
  type    = "list"
  default = ["eu-central-1a", "eu-central-1b"]
}