#
##
### GENERAL
##
#
variable "stage" {
  default = "dev"
  type    = string
}

variable "stage-domain" {
  default = {
    dev  = "kubewp.tk"
    prod = "kubewp.com"
  }
  type = object({
    dev  = string
    prod = string
  })
}

variable "aws-region" {
  default = "ap-northeast-1"
  type    = string
}

#
##
### EC2, EKS & K8s
##
#
variable "eks-cluster-name" {
  default = "kube-wp"
  type    = string
}

variable "wn-disk-size" {
  default = 8
  type    = number
}

variable "wn-instance-types" {
  default = {
    dev  = ["t2.small"]
    prod = ["m5.2xlarge"]
  }
  type = object({
    dev  = list(string)
    prod = list(string)
  })
}

#
##
### SECURITY GROUPS & ACLS
##
#
variable "team-ips" {
  default = [
    "1.1.1.1/32",
    "8.8.8.8/32",
    "116.82.102.140/32"
  ]
  type = list(string)
}

#
##
### RDS
##
#
variable "rds-instance-type" {
  default = {
    dev  = "db.t3.medium"
    prod = "db.m6.2xlarge"
  }
  type = object({
    dev  = string
    prod = string
  })
}
