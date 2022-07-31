resource "aws_security_group" "service_ec2_security_group" {
  name        = "service_ec2-sg-${var.environment}"
  description = "Created by Terraform"
  vpc_id      = aws_vpc.belong_coding_challenge_vpc.id

  dynamic "ingress" {
    for_each = var.service_ports_map_in
    content {
      from_port   = ingress.key
      to_port     = ingress.key
      protocol    = var.service_ec2_sg_ingress_protocol
      cidr_blocks = ingress.value
    }
  }

  dynamic "egress" {
    for_each = var.service_ports_map_out
    content {
      from_port   = egress.key
      to_port     = egress.key
      protocol    = var.service_ec2_sg_egress_protocol
      cidr_blocks = egress.value
    }
  }

  tags = {
    Name = "service_ec2-sg-${var.environment}"
  }
}
