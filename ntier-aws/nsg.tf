resource "aws_security_group" "ntier_nsg" {
  name        = "allow_db"
  description = "Allow db inbound traffic"
  vpc_id      = aws_vpc.ntier_vpc.id

  ingress {
    description      = "TLS from VPC"
    from_port        = 3306
    to_port          = 3306
    protocol         = "tcp"
    cidr_blocks      = [local.app1]
    # ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
  }

  egress {
    from_port        = 3306
    to_port          = 3306
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_tls"
  }
  depends_on = [
    aws_subnet.ntier_subnets,
    aws_vpc.ntier_vpc
  ]
}