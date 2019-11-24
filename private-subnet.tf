resource "aws_subnet" "private-sub" {
  count = 2
  vpc_id     = "${aws_vpc.my_vpc.id}"
  cidr_block = "${var.private_subnet_cidrs[count.index]}"
  availability_zone = "${var.availability_zones[count.index]}"

  tags = {
    Name = "private-subnet-${count.index + 1}"
  }
}