provider "aws" {
  region  = "${var.vpc_region}"
}

#storing statefile over the S3 and using dynamodb_table to avoid concurrency issue
terraform {
  backend "s3" {
    bucket = "sud7828"
    key    = "sud/terraform.tfstate"
    region = "eu-central-1"
    dynamodb_table = "terraform-lock"
  }
}
#creating vpc
resource "aws_vpc" "my_vpc" {
  cidr_block       = "${var.vpc_cidr}"
  instance_tenancy = "default"

  tags = {
    Name = "${var.vpc_tags}"
  }
}

#creating internet gateway

resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.my_vpc.id}"

  tags = {
    Name = "igw"
  }
}




