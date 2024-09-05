resource "aws_vpc" "medusa_vpc" {
  cidr_block = "10.0.0.0/16"  # Keep this CIDR block if you're creating a new VPC; adjust if needed.
  tags = {
    Name = "medusa-vpc"
  }
}

resource "aws_subnet" "medusa_subnet" {
  vpc_id            = aws_vpc.medusa_vpc.id
  cidr_block        = "10.0.1.0/24"  # Ensure this is within the VPC CIDR block
  availability_zone = "ap-south-1a"  # Valid based on your output
  tags = {
    Name = "medusa-subnet"
  }
}

resource "aws_internet_gateway" "medusa_igw" {
  vpc_id = aws_vpc.medusa_vpc.id
  tags = {
    Name = "medusa-igw"
  }
}

resource "aws_route_table" "medusa_route_table" {
  vpc_id = aws_vpc.medusa_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.medusa_igw.id
  }
  tags = {
    Name = "medusa-route-table"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.medusa_subnet.id
  route_table_id = aws_route_table.medusa_route_table.id
}

