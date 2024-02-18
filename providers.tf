
#
## Terraform Version
#
terraform {
  # https://developer.hashicorp.com/terraform/install
  required_version = ">= 1.7.0"
}

#
## AWS Provider
#
provider "aws" {
  region  = var.aws-region
  profile = "terraform-kube-wp-${var.stage}"
}

data "aws_availability_zones" "available" {}

#
## Kubernetes Provider
#
provider "kubernetes" {
  host                   = data.aws_eks_cluster.eks-cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.eks-cluster.certificate_authority.0.data)
  token                  = data.aws_eks_cluster_auth.eks-cluster.token
}
