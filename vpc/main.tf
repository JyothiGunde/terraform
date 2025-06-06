resource "aws_vpc" "Demo" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "Demo"
  }
}

resource "aws_subnet" "Public_subnet" {
  vpc_id = aws_vpc.Demo.id
  cidr_block = "10.0.1.0/24"
}

resource "aws_subnet" "Private_subnet" {
  vpc_id = aws_vpc.Demo.id
  cidr_block = "10.0.2.0/24"
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.Demo.id
}

resource "aws_route_table" "public_RT" {
  vpc_id = aws_vpc.Demo.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "Public_RT_Association" {
  subnet_id = aws_subnet.Public_subnet.id
  route_table_id = aws_route_table.public_RT.id
}