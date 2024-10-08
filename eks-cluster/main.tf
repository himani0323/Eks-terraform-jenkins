module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "4.0.2"

  name = "jenkins-vpc"
  cidr = var.vpc_cidr
  
  azs = var.azs
  private_subnets = var.private_subnets
  public_subnets = var.public_subnets
  
  enable_dns_hostnames = true
  enable_nat_gateway = true
  single_nat_gateway = true
  tags = {
    Name = "jenkins-vpc"
  }
}
module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = "my-eks-cluster"
  cluster_version = "1.30"


  vpc_id                   = module.vpc.vpc_id
  subnet_ids               = module.vpc.private_subnets
  

  eks_managed_node_groups = {
    nodes = {
      min_size     = 1
      max_size     = 3
      desired_size = 2
      instance_type= ["t2.small "]
    }
  }
}
