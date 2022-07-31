variable "environment" {
  type = string
}

variable "vpc_cidr_block" {
  type = string
}

variable "pri_newbits_2a" {
  type = number
}

variable "pri_newbits_2b" {
  type = number
}

variable "pri_newbits_2c" {
  type = number
}

variable "pri_netnum_2a" {
  type = number
}

variable "pri_netnum_2b" {
  type = number
}

variable "pri_netnum_2c" {
  type = number
}

variable "pub_newbits_2a" {
  type = number
}

variable "pub_netnum_2a" {
  type = number
}

variable "pub_newbits_2b" {
  type = number
}

variable "pub_netnum_2b" {
  type = number
}

variable "pub_newbits_2c" {
  type = number
}

variable "pub_netnum_2c" {
  type = number
}

variable "bastion_ports_map_in" {
  type        = map(list(string))
  description = "rds-ingress"
}

variable "bastion_ports_map_out" {
  type        = map(list(string))
  description = "rds-ingress"
}

variable "service_ports_map_in" {
  type        = map(list(string))
  description = "rds-ingress"
}

variable "service_ports_map_out" {
  type        = map(list(string))
  description = "rds-ingress"
}

variable "alb_ports_map_in" {
  type        = map(list(string))
  description = "rds-ingress"
}

variable "alb_ports_map_out" {
  type        = map(list(string))
  description = "rds-ingress"
}

variable "bastion_ec2_sg_ingress_protocol" {
  type = string
}

variable "bastion_ec2_sg_egress_protocol" {
  type = string
}

variable "service_ec2_sg_ingress_protocol" {
  type = string
}

variable "service_ec2_sg_egress_protocol" {
  type = string
}

variable "alb_sg_ingress_protocol" {
  type = string
}

variable "alb_sg_egress_protocol" {
  type = string
}

variable "ami" {
  type = string
}

variable "instance_type" {
  type = string
}
