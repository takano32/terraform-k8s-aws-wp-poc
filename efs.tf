#
##
### EFS
##
#
module "efs-wp-content" {
  # https://registry.terraform.io/modules/cloudposse/efs/aws/latest
  source  = "cloudposse/efs/aws"
  version = "0.35.0"

  namespace = "kube-wp"
  name      = "wp-content"
  region    = var.aws-region
  vpc_id    = module.vpc.vpc_id
  subnets   = module.vpc.private_subnets
  additional_security_group_rules = [
    {
      "cidr_blocks" : ["10.0.0.0/16"],
      "description" : "Allow all outbound traffic within the VPC",
      "from_port" : 0,
      "protocol" : "-1",
      "to_port" : 0,
      "type" : "egress"
    },
    {
      "cidr_blocks" : ["10.0.0.0/16"],
      "description" : "Allow all traffic from within the VPC",
      "from_port" : 0,
      "protocol" : "-1",
      "to_port" : 0,
      "type" : "ingress"
    },
  ]
}
