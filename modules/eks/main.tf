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

resource "aws_iam_role" "eks_role" {
  name = var.eks_iam_role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Service = "eks.amazonaws.com"
      }
      Action = "sts:AssumeRole"
    }]
  })

  tags = {
    Name = "EKSClusterRole"
  }
}

resource "aws_iam_role_policy_attachment" "eks_cluster_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.eks_role.name
}

resource "aws_iam_role_policy_attachment" "eks_worker_node_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.eks_role.name
}

resource "aws_iam_role_policy_attachment" "eks_cni_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.eks_role.name
}
