resource "aws_db_subnet_group" "db_security" {
  name = "mysqldbsubnetgroup"
    subnet_ids = [ aws_subnet.ntier_subnets[0].id, aws_subnet.ntier_subnets[1].id ]
    depends_on = [
        aws_subnet.ntier_subnets
    ]
}

resource "aws_db_instance" "default" {
  allocated_storage    = 10
  db_name              = "mydb"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  username             = "foo"
  password             = "foobarbaz"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  db_subnet_group_name = aws_db_subnet_group.db_security.name
#   depends_on = [
#     aws_db_subnet_group.db_security,
#     aws_security_group.ntier_nsg
#   ]
  vpc_security_group_ids = [aws_security_group.ntier_nsg.id]
}