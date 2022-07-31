# Bastion EIP
resource "aws_eip" "belong_coding_challenge_eip" {
  instance = aws_instance.belong_coding_challenge_bastion_ec2_instance.id
  vpc      = true
}

resource "aws_eip_association" "belong_coding_challenge_eip_association" {
  instance_id   = aws_instance.belong_coding_challenge_bastion_ec2_instance.id
  allocation_id = aws_eip.belong_coding_challenge_eip.id
}

# NAT gateway EIP
resource "aws_eip" "nat_gateway_eip" {
  vpc              = true
  public_ipv4_pool = "amazon"
}
