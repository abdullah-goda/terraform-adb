provider "aws" {
  # shared_config_files      = ["/Users/godaa/.aws/sand-box-config"]
  # shared_credentials_files = ["/Users/godaa/.aws/sand-box-cred"]
  # profile                  = "sand-box"
  region = "eu-central-1"
}

resource "aws_vpc" "main" {
 cidr_block = "10.0.0.0/16"
 
 tags = {
   Name = "Intial VPC"
 }
}


resource "aws_internet_gateway" "gw" {
 vpc_id = aws_vpc.main.id
 
 tags = {
   Name = "Project VPC IG"
 }
}

resource "aws_route_table" "second_rt" {
 vpc_id = aws_vpc.main.id
 
 route {
   cidr_block = "0.0.0.0/0"
   gateway_id = aws_internet_gateway.gw.id
 }
 
 tags = {
   Name = "2nd Route Table"
 }
}

resource "aws_route_table_association" "public_subnet_asso" {
 count = length(var.public_subnet_cidrs)
 subnet_id      = element(aws_subnet.public_subnets[*].id, count.index)
 route_table_id = aws_route_table.second_rt.id
}



resource "aws_eip" "nat_gateway" {
  vpc = true
}

resource "aws_nat_gateway" "NAT_Trial" {
  allocation_id = aws_eip.nat_gateway.id
  subnet_id     = aws_subnet.public_subnets[0].id

  tags = {
    Name = "gw NAT"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.gw]
}





