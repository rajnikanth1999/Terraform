resource "aws_subnet" "ntier_subnets" {
  vpc_id = aws_vpc.ntier_vpc.id
  count = length(var.subnet_tags)
  availability_zone = var.subnet_regions[count.index]
  cidr_block = cidrsubnet(var.vpc_cidr,8,count.index)
  tags = {
    "Name" = var.subnet_tags[count.index]
  }
  depends_on = [
    aws_vpc.ntier_vpc
  ]
}