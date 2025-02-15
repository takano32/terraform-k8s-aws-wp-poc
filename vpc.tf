#
##
### VPC
##
#
module "vpc" {
  # https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.5.2"

  name                 = "${var.eks-cluster-name}-vpc"
  cidr                 = "10.0.0.0/16"
  azs                  = ["ap-northeast-1a", "ap-northeast-1c", "ap-northeast-1d"]
  private_subnets      = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  database_subnets     = ["10.0.21.0/24", "10.0.22.0/24", "10.0.23.0/24"]
  public_subnets       = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_vpn_gateway   = false
  enable_dns_hostnames = true

  public_subnet_tags = {
    "kubernetes.io/cluster/${var.eks-cluster-name}" = "shared"
    "kubernetes.io/role/elb"                        = "1"
  }

  private_subnet_tags = {
    "kubernetes.io/cluster/${var.eks-cluster-name}" = "shared"
    "kubernetes.io/role/internal-elb"               = "1"
  }
}
