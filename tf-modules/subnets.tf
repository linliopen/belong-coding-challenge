# Subnets
resource "aws_subnet" "private_subnet_2a" {
  vpc_id            = aws_vpc.belong_coding_challenge_vpc.id
  availability_zone = data.aws_availability_zones.available.names[0]
  cidr_block        = cidrsubnet(aws_vpc.belong_coding_challenge_vpc.cidr_block, var.pri_newbits_2a, var.pri_netnum_2a)
  tags = {
    Name = "pri-subnet-2a-${var.environment}"
  }
}

resource "aws_subnet" "private_subnet_2b" {
  vpc_id            = aws_vpc.belong_coding_challenge_vpc.id
  availability_zone = data.aws_availability_zones.available.names[1]
  cidr_block        = cidrsubnet(aws_vpc.belong_coding_challenge_vpc.cidr_block, var.pri_newbits_2b, var.pri_netnum_2b)
  tags = {
    Name = "pri-subnet-2b-${var.environment}"
  }
}

resource "aws_subnet" "private_subnet_2c" {
  vpc_id            = aws_vpc.belong_coding_challenge_vpc.id
  availability_zone = data.aws_availability_zones.available.names[2]
  cidr_block        = cidrsubnet(aws_vpc.belong_coding_challenge_vpc.cidr_block, var.pri_newbits_2c, var.pri_netnum_2c)
  tags = {
    Name = "pri-subnet-2c-${var.environment}"
  }
}

resource "aws_subnet" "public_subnet_2a" {
  vpc_id            = aws_vpc.belong_coding_challenge_vpc.id
  availability_zone = data.aws_availability_zones.available.names[0]
  cidr_block        = cidrsubnet(aws_vpc.belong_coding_challenge_vpc.cidr_block, var.pub_newbits_2a, var.pub_netnum_2a)
  tags = {
    Name = "pub-subnet-2a-${var.environment}"
  }
}

resource "aws_subnet" "public_subnet_2b" {
  vpc_id            = aws_vpc.belong_coding_challenge_vpc.id
  availability_zone = data.aws_availability_zones.available.names[1]
  cidr_block        = cidrsubnet(aws_vpc.belong_coding_challenge_vpc.cidr_block, var.pub_newbits_2b, var.pub_netnum_2b)
  tags = {
    Name = "pub-subnet-2b-${var.environment}"
  }
}

resource "aws_subnet" "public_subnet_2c" {
  vpc_id            = aws_vpc.belong_coding_challenge_vpc.id
  availability_zone = data.aws_availability_zones.available.names[2]
  cidr_block        = cidrsubnet(aws_vpc.belong_coding_challenge_vpc.cidr_block, var.pub_newbits_2c, var.pub_netnum_2c)
  tags = {
    Name = "pub-subnet-2c-${var.environment}"
  }
}

# Route tables
resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.belong_coding_challenge_vpc.id
  tags = {
    Name = "pri-rtb-${var.environment}"
  }
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat-gateway.id
  }
}

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.belong_coding_challenge_vpc.id
  tags = {
    Name = "pub-rtb-${var.environment}"
  }
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id    
  }
}

# Route table associations
resource "aws_route_table_association" "private_subnet_2a_association" {
  subnet_id      = aws_subnet.private_subnet_2a.id
  route_table_id = aws_route_table.private_route_table.id
}

resource "aws_route_table_association" "private_subnet_2b_association" {
  subnet_id      = aws_subnet.private_subnet_2b.id
  route_table_id = aws_route_table.private_route_table.id
}

resource "aws_route_table_association" "private_subnet_2c_association" {
  subnet_id      = aws_subnet.private_subnet_2c.id
  route_table_id = aws_route_table.private_route_table.id
}

resource "aws_route_table_association" "public_subnet_2a_association" {
  subnet_id      = aws_subnet.public_subnet_2a.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "public_subnet_2b_association" {
  subnet_id      = aws_subnet.public_subnet_2b.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "public_subnet_2c_association" {
  subnet_id      = aws_subnet.public_subnet_2c.id
  route_table_id = aws_route_table.public_route_table.id
}
