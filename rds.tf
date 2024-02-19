#
##
### RDS
##
#
locals {
  kubewpdb-name = "kubewpdb"
  kubewpdb-creds = {
    user = "kubewpdbuser"
    pass = "kubewpdbpass"
  }
}

module "kubewpdb" {
  # https://registry.terraform.io/modules/cloudposse/rds-cluster/aws/latest
  source  = "cloudposse/rds-cluster/aws"
  version = "1.7.0"

  engine         = "aurora-mysql"
  engine_mode    = "provisioned"
  engine_version = "8.0.mysql_aurora.3.04.1"
  cluster_family = "aurora-mysql8.0"
  cluster_size   = 1
  name           = local.kubewpdb-name
  admin_user     = local.kubewpdb-creds.user
  admin_password = local.kubewpdb-creds.pass
  db_name        = local.kubewpdb-name
  instance_type  = var.rds-instance-type[var.stage]
  vpc_id         = module.vpc.vpc_id
  subnets        = module.vpc.database_subnets
  security_groups = [
    aws_security_group.kube-wp-sg.id,
    module.eks.cluster_primary_security_group_id
  ]
  skip_final_snapshot = (var.stage == "dev")
}
