resource "aws_route_table" "vpc_public_route" {
  vpc_id = aws_vpc.ntier_vpc.id
  tags = {
    Name = "public route"
  }
  route {
    gateway_id = aws_internet_gateway.ntier_igw.id
    cidr_block = "0.0.0.0/0"
  }
}

resource "aws_route_table_association" "public_subnet" {
  count = 2
    subnet_id      = aws_subnet.ntier_subnets[count.index].id
    route_table_id = aws_route_table.vpc_public_route.id
}

resource "aws_route_table" "vpc_private_route" {
  vpc_id = aws_vpc.ntier_vpc.id
  tags = {
    Name = "private route"
  }
  route {
    cidr_block              = "0.0.0.0/0"
    nat_gateway_id          = aws_nat_gateway.vpc_nat.id
  }
}