resource "aws_instance" "belong_coding_challenge_service_ec2_instance" {
  ami                         = var.ami
  instance_type               = var.instance_type
  associate_public_ip_address = true
  subnet_id                   = aws_subnet.private_subnet_2a.id
  key_name                    = aws_key_pair.belong_coding_challenge_service_ec2_instance_key_pair.key_name
  vpc_security_group_ids      = [aws_security_group.service_ec2_security_group.id]
  user_data                   = file("./script/user-data.sh")

  tags = {
    Name = "belong-coding-challenge-service-${var.environment}"
  }
}

resource "aws_key_pair" "belong_coding_challenge_service_ec2_instance_key_pair" {
  key_name   = "belong-coding-challenge-service-ec2-instance-key"
  public_key = file("./service_id_rsa.pub")
}
