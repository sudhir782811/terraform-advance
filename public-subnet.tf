#resource "aws_subnet" "public_sub" {
#  count = 2
#  vpc_id     = "${aws_vpc.my_vpc.id}"
#  cidr_block = "${var.subnet_cidrs[count.index]}"

#  tags = {
#    Name = "public-subnet-${count.index+1}-${terraform.workspace}"
#  }
#}

##### Creating subnet

resource "aws_subnet" "public_sub" {
  #count = "{lenght(data.aws_availability_zones.azs.names)}"
  count = "${length(local.azs_names)}"
  availability_zone = "${element(local.azs_names,count.index)}" #take one elememt at a time from list and create subnet in different AZ
  vpc_id     = "${aws_vpc.my_vpc.id}"
  map_public_ip_on_launch = true
  cidr_block = "${cidrsubnet(var.vpc_cidr, 8, count.index + 1)}"

  tags = {
    Name = "public-subnet-${count.index + 1}"
  }
}

## Creating route table

resource "aws_route_table" "public-rt" {
  vpc_id = "${aws_vpc.my_vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.igw.id}"
  }

  tags = {
    Name = "public-rt"
  }
}

## Subnet association

resource "aws_route_table_association" "public-sub-association" {
  count = "${length(local.azs_names)}"
  subnet_id      = "${local.pub_subnet[count.index]}"
  route_table_id = "${aws_route_table.public-rt.id}"
}