module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = var.cluster_name
  cluster_version = "1.29"
  vpc_id         = var.vpc_id
  subnet_ids     = var.subnet_ids
  # subnet_ids     = module.vpc.private_subnets  # Ensure nodes are in private subnets
  enable_irsa    = true

  # Allow EKS API Public Access
  cluster_endpoint_public_access = true  # ✅ Enable Public Access
  cluster_endpoint_public_access_cidrs = ["0.0.0.0/0"]  # ✅ Allow access from anywhere (change for security)

  eks_managed_node_groups = {
    eks_nodes = {
      instance_types = ["t3.medium"]
      min_size       = 1
      max_size       = 3
      desired_size   = 2
    }
  }
}
