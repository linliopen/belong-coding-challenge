output "bastion_eip" { 
  description = "Public IP address of the bastion EC2 instance" 
  value = aws_instance.belong_coding_challenge_bastion_ec2_instance.public_ip 
}

output "service_ip" { 
  description = "Private IP address of the service EC2 instance" 
  value = aws_instance.belong_coding_challenge_service_ec2_instance.private_ip 
}
