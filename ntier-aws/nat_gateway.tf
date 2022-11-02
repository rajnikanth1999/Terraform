resource "aws_eip" "eip" {
  depends_on = [
    aws_vpc.ntier_vpc
  ]
  tags = {
    "Name" = var.tag
  }
}

resource "aws_nat_gateway" "vpc_nat" {
  subnet_id = aws_subnet.ntier_subnets[0].id
  allocation_id = aws_eip.eip.id
  depends_on = [
    aws_subnet.ntier_subnets,
    aws_eip.eip
  ]
  tags = {
    "Name" = var.tag
  }
}