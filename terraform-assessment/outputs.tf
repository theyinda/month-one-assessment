output "vpc_id" { value = aws_vpc.techcorp_vpc.id }
output "load_balancer_dns_name" { value = aws_lb.techcorp_alb.dns_name }
output "bastion_public_ip" { value = aws_eip.bastion_eip.public_ip }
output "web_server_1_private_ip" { value = aws_instance.web_server_1.private_ip }
output "web_server_2_private_ip" { value = aws_instance.web_server_2.private_ip }
output "db_server_private_ip" { value = aws_instance.db_server.private_ip }
