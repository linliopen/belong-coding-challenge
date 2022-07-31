resource "aws_vpc" "belong_coding_challenge_vpc" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name = "belong-coding-challenge-vpc-${var.environment}"
  }
}
