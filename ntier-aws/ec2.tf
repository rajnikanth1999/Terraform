resource "aws_key_pair" "ec2_key" {
  key_name   = "my_key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDxhsCVwiXtnyRGUDtrzKKiX0NeDeZ+p3KjxUnYlMyrITKCmfWj85YfAZBOE2WigDPW4MGFSv5Q5Qry257FSfAwg+3VMfc5ZH5TOj1rzWQQTk6LnzOtw2o+13DzCizDd/0ZRVzXUzWz/iiljbJepkURkG7QSyHRjPwK9um8cCFfkqYialPb8scUOc4ryaNYovs+EhDRIjg7M/7CBCjNZji3x4CHPFf5UtUEd0RyOuAr6Ty9eD6GWd52ADRUMQcSmwbofHM0OFEzX4Y4Fmp+jGxWDyudcO+dcsyErxnBi8pYL91tTsVOWA6S6vYUTMechDqJKcE4Q3HJcj3sG+FflmOfWKrvvWvK/BeFGGiItlaVhTkdxQNR2jvBaC3vGGV7nmG/fQ2Qo3Opv16Rbgr2yi53DR+MKVQK7HHrc062yB7ABS2YNQ59al8dRal2tkbfv6Q8Hx7UImG9OzLyL9M4g2h9oF14TJfglahYgRFrdw4gA3soezaWV7kT57zPb6K3DvE= nanimuppalla@NANIs-MacBook-Air.local"
}

resource "aws_instance" "ntier_ec2" {
  ami = "ami-062df10d14676e201"
  associate_public_ip_address = true
  key_name = aws_key_pair.ec2_key.key_name
  subnet_id = aws_subnet.ntier_subnets[0].id
  instance_type = "t2.micro"
  vpc_security_group_ids = [
    aws_security_group.ntier_nsg.id
  ]
  depends_on = [
    aws_eip.eip,
  ]
}