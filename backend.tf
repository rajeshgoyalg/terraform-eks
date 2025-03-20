terraform {
  backend "s3" {
    bucket         = "my-demo-eks-tf-state"
    key            = "eks-cluster/terraform.tfstate"
    region         = "ap-southeast-1"
    encrypt        = true
    dynamodb_table = "my-demo-eks-tf-locking"
  }
}
