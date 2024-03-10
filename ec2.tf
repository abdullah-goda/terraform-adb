resource "aws_instance" "front-end" {
  ami                         = "ami-04dfd853d88e818e8"
  instance_type               = "t2.micro"
  vpc_security_group_ids      = [aws_security_group.public_SG.id]
  associate_public_ip_address = true
  subnet_id                   = aws_subnet.public_subnets[0].id
    # depends_on = [ output.sec_group.value ]
  tags = {
    Name = "front-end"
  }

}
resource "aws_instance" "front-end-2" {
  ami                         = "ami-04f9a173520f395dd"
  instance_type               = "t2.micro"
  vpc_security_group_ids      = [aws_security_group.public_SG.id]
  associate_public_ip_address = true
  subnet_id                   = aws_subnet.public_subnets[0].id
    # depends_on = [ output.sec_group.value ]
  tags = {
    Name = "front-end-2"
  }

}

resource "aws_instance" "backend" {
  ami                         = "ami-04f9a173520f395dd"
  instance_type               = "t2.micro"
  vpc_security_group_ids      = [aws_security_group.public_SG.id]
  associate_public_ip_address = true
  subnet_id                   = aws_subnet.public_subnets[0].id
    #   depends_on = [ sec_group.value ]
  tags = {
    Name = "backend"
  }

}

# resource "aws_instance" "backend_2" {
#   ami                         = "ami-04f9a173520f395dd"
#   instance_type               = "t2.micro"
#   vpc_security_group_ids      = [aws_security_group.public_SG.id]
#   associate_public_ip_address = true
#   subnet_id                   = aws_subnet.public_subnets[0].id
#     #   depends_on = [ sec_group.value ]
#   tags = {
#     Name = "backend"
#   }

# }

# resource "aws_instance" "backend_3" {
#   ami                         = "ami-04f9a173520f395dd"
#   instance_type               = "t2.micro"
#   vpc_security_group_ids      = [aws_security_group.public_SG.id]
#   associate_public_ip_address = true
#   subnet_id                   = aws_subnet.public_subnets[0].id
#     #   depends_on = [ sec_group.value ]
#   tags = {
#     Name = "backend"
#   }

# }