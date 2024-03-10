resource "aws_db_instance" "myinstance" {
  engine               = "mysql"
  identifier           = "my-rds-instance-private"
  db_subnet_group_name = aws_db_subnet_group.my_db_subnet_group.name
  allocated_storage    =  20
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  username             = "****"
  password             = "*****"
  parameter_group_name = "default.mysql5.7"
  vpc_security_group_ids = ["${aws_security_group.rds_sg.id}"]
  publicly_accessible =  false
  multi_az               = false  
  #   skip_final_snapshot  = true
}

# resource "aws_db_instance" "default" {
#   allocated_storage    = 10
#   identifier           = "my_rds-instance-private-2"
#   db_name              = "mydb"
#   engine               = "mysql"
#   engine_version       = "5.7"
#   instance_class       = "db.t3.micro"
#   username             = "foo"
#   password             = "foobarbaz3243"
#   parameter_group_name = "default.mysql5.7"
# #   skip_final_snapshot  = true
#   publicly_accessible =  false
# }