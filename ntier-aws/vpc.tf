resource "aws_vpc" "ntier_vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    "Name" = var.vpc_name_tag
  }
}