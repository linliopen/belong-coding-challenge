resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.belong_coding_challenge_vpc.id

  tags = {
    Name = "igw-${var.environment}"
  }
}
