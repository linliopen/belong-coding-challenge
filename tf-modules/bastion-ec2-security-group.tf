resource "aws_security_group" "bastion_ec2_security_group" {
  name        = "bastion_ec2-sg-${var.environment}"
  description = "Created by Terraform"
  vpc_id      = aws_vpc.belong_coding_challenge_vpc.id

  dynamic "ingress" {
    for_each = var.bastion_ports_map_in
    content {
      from_port   = ingress.key
      to_port     = ingress.key
      protocol    = var.bastion_ec2_sg_ingress_protocol
      cidr_blocks = ingress.value
    }
  }

  dynamic "egress" {
    for_each = var.bastion_ports_map_out
    content {
      from_port   = egress.key
      to_port     = egress.key
      protocol    = var.bastion_ec2_sg_egress_protocol
      cidr_blocks = egress.value
    }
  }

  tags = {
    Name = "bastion-ec2-sg-${var.environment}"
  }
}
