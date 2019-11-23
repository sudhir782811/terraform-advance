provider "aws" {
  region  = "${var.vpc_region}"
}

terraform {
  backend "s3" {
    bucket = "sud7828"
    key    = "sud/terraform.tfstate"
    region = "eu-central-1"
    dynamodb_table = "terraform-lock"
  }
}
resource "aws_vpc" "my_vpc" {
  cidr_block       = "${var.vpc_cidr}"
  instance_tenancy = "default"

  tags = {
    Name = "${var.vpc_tags}"
  }
}