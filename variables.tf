variable "aws_region" {
  description = "AWS region for EKS"
  type        = string
  default     = "ap-southeast-1"
}

variable "cluster_name" {
  description = "EKS Cluster Name"
  type        = string
  default     = "my-demo-eks-cluster"
}
