environment                     = "test"
vpc_cidr_block                  = "10.32.0.0/16"
pri_newbits_2a                  = 8
pri_netnum_2a                   = 50
pri_newbits_2b                  = 8
pri_netnum_2b                   = 51
pri_newbits_2c                  = 8
pri_netnum_2c                   = 52
pub_newbits_2a                  = 8
pub_netnum_2a                   = 53
pub_newbits_2b                  = 8
pub_netnum_2b                   = 54
pub_newbits_2c                  = 8
pub_netnum_2c                   = 55
ami                             = "ami-0e040c48614ad1327"
instance_type                   = "t2.micro"
bastion_ec2_sg_ingress_protocol = "tcp"
bastion_ec2_sg_egress_protocol  = "-1" # "All"
service_ec2_sg_ingress_protocol = "tcp"
service_ec2_sg_egress_protocol  = "-1" # "All"
alb_sg_ingress_protocol = "tcp"
alb_sg_egress_protocol  = "-1" # "All"

bastion_ports_map_in = {
  "22" = ["0.0.0.0/0"]
}
bastion_ports_map_out = {
  "0" = ["0.0.0.0/0"]
}
service_ports_map_in = {
  "22" = ["0.0.0.0/0"]
  "80" = ["0.0.0.0/0"]
}
service_ports_map_out = {
  "0" = ["0.0.0.0/0"]
}
alb_ports_map_in = {
  "80" = ["0.0.0.0/0"]
  "443" = ["0.0.0.0/0"]
}
alb_ports_map_out = {
  "0" = ["0.0.0.0/0"]
}
