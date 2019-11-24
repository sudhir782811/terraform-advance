locals {
    azs_names = "${data.aws_availability_zones.azs.names}"
    pub_subnet = "${aws_subnet.public_sub.*.id}"
}