resource "aws_internet_gateway" "ntier_igw" {
  vpc_id = aws_vpc.ntier_vpc.id
  tags = {
    Name = var.tag
  }
  depends_on = [
    aws_vpc.ntier_vpc
  ]
}