resource "aws_nat_gateway" "nat-gateway" {
  allocation_id     = aws_eip.nat_gateway_eip.id
  connectivity_type = "public"
  subnet_id         = aws_subnet.public_subnet_2a.id

  tags = {
    Name = "NAT-gateway"
  }

  depends_on = [aws_internet_gateway.igw]
}