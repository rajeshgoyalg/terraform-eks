variable "cluster_name" {
  description = "EKS Cluster Name"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs"
  type        = list(string)
}

variable "eks_iam_role_name" {
  description = "The name of the IAM role for EKS cluster"
  type        = string
  default     = "eks-cluster-role"
}
