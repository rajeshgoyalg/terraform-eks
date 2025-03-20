output "cluster_id" {
  description = "EKS Cluster ID"
  value       = module.eks.cluster_id
}

output "cluster_endpoint" {
  description = "Endpoint for the EKS cluster"
  value       = module.eks.cluster_endpoint
}

output "cluster_security_group_id" {
  description = "EKS Cluster Security Group ID"
  value       = module.eks.cluster_security_group_id
}

# output "node_group_arns" {
#   description = "ARNs of the EKS node groups"
#   value       = module.eks.eks_managed_node_groups[*].node_group_arn
# }

output "node_group_arns" {
  description = "ARNs of the EKS node groups"
  value       = [for ng in module.eks.eks_managed_node_groups : ng.node_group_arn]
}

output "eks_iam_role_arn" {
  description = "IAM Role ARN for EKS Cluster"
  value       = aws_iam_role.eks_role.arn
}

output "eks_iam_role_name" {
  description = "IAM Role Name for EKS Cluster"
  value       = aws_iam_role.eks_role.name
}
