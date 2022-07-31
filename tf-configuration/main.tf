provider "aws" {
  region                   = "ap-southeast-2"
  shared_credentials_files = ["/home/roger/.aws/credentials"]
  profile                  = "belong-coding-challenge"
}

# Store state files
# terraform {
#   backend "s3" {
#     encrypt        = "true"
#     bucket         = "pf-tf-remote-state-storage"
#     key            = "./terraform.tfstate"
#     region         = "ap-southeast-2"
#     profile        = "default"
#     dynamodb_table = "pf-tf-state-lock-dynmodb"
#   }
# }

module "belong_coding_challenge_module" {
  # source = "git@github.com:/challenge/" 
  source = "/home/roger/John-Roger-Kevin-Org/challenge/tf-modules/"

  environment                     = var.environment
  vpc_cidr_block                  = var.vpc_cidr_block
  pri_newbits_2a                  = var.pri_newbits_2a
  pri_netnum_2a                   = var.pri_netnum_2a
  pri_newbits_2b                  = var.pri_newbits_2b
  pri_netnum_2b                   = var.pri_netnum_2b
  pri_newbits_2c                  = var.pri_newbits_2c
  pri_netnum_2c                   = var.pri_netnum_2c
  pub_newbits_2a                  = var.pub_newbits_2a
  pub_netnum_2a                   = var.pub_netnum_2a
  pub_newbits_2b                  = var.pub_newbits_2b
  pub_netnum_2b                   = var.pub_netnum_2b
  pub_newbits_2c                  = var.pub_newbits_2c
  pub_netnum_2c                   = var.pub_netnum_2c
  bastion_ports_map_in            = var.bastion_ports_map_in
  bastion_ec2_sg_ingress_protocol = var.bastion_ec2_sg_ingress_protocol
  bastion_ports_map_out           = var.bastion_ports_map_out
  bastion_ec2_sg_egress_protocol  = var.bastion_ec2_sg_egress_protocol
  service_ports_map_in            = var.service_ports_map_in
  service_ec2_sg_ingress_protocol = var.service_ec2_sg_ingress_protocol
  service_ports_map_out           = var.service_ports_map_out
  service_ec2_sg_egress_protocol  = var.service_ec2_sg_egress_protocol
  alb_ports_map_in                = var.alb_ports_map_in
  alb_sg_ingress_protocol         = var.alb_sg_ingress_protocol
  alb_ports_map_out               = var.alb_ports_map_out
  alb_sg_egress_protocol          = var.alb_sg_egress_protocol
  ami                             = var.ami
  instance_type                   = var.instance_type
}
