resource "aws_security_group" "rds_sg" {
  name = "rds_sg"
  vpc_id      = aws_vpc.main.id 
  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
    tags = {
    Name = "Mysql-RDS-security-group"
  }
}


resource "aws_security_group" "public_SG" {
  name        = "allow-all-sg-ssh"
  description = "Allow ssh to the server and access to the internet"
  vpc_id      = aws_vpc.main.id
  ingress {
    description = "SSH ingress"
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "tf-security-group-ssh"
  }
}