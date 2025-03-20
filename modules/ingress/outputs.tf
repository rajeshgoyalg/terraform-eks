output "alb_dns_name" {
  description = "DNS name of the Application Load Balancer"
  value       = aws_lb.eks_alb.dns_name
}

output "alb_security_group_id" {
  description = "Security Group ID for ALB"
  value       = aws_security_group.alb_sg.id
}
