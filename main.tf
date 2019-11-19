# EKS Terraform module

module "eks" {
  source             = "./modules/eks"
  cluster-name       = "${var.cluster-name}"
  k8s-version        = "${var.k8s-version}"
  aws-region         = "${var.aws-region}"
  node-instance-type = "${var.node-instance-type}"
  node-key-pair      = "${var.node-key-pair}"
  desired-capacity   = "${var.desired-capacity}"
  max-size           = "${var.max-size}"
  min-size           = "${var.min-size}"
  eks-vpc            = "${var.eks-vpc}"
  eks-subnet-0       = "${var.eks-subnet-0}"
  eks-subnet-1       = "${var.eks-subnet-1}"
  bastion-cidr       = "${var.bastion-cidr}"
  elb-sg             = "${var.elb-sg}"
}
