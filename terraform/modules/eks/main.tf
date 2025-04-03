

locals {
  name   = "pc-cluster"

 
  tags = {
    Example = local.name
  }
}


module "eks" {
  source = "terraform-aws-modules/eks/aws"
  version = "~> 20.31"

  cluster_name    = local.name
  cluster_version = "1.31"

  cluster_endpoint_public_access  = true
  cluster_endpoint_public_access_cidrs = ["179.26.144.208/32"] # Agregar el rango de IPs públicas de PetClinic

  cluster_addons = {
    coredns = {
      most_recent = true
    }
    kube-proxy = {
      most_recent = true
    }
    vpc-cni = {
      most_recent = true
    }
  }

  vpc_id                   = var.vpc_id
  subnet_ids               = var.subnet_ids
  control_plane_subnet_ids = var.subnet_ids

  # EKS Managed Node Group(s)
  eks_managed_node_group_defaults = {
    instance_types = ["m6i.large", "m5.large"]
  }

  eks_managed_node_groups = {
    petClinic-node-group = {
      min_size     = 1
      max_size     = 3
      desired_size = 2

      instance_types = ["t2.micro"]
      capacity_type  = "SPOT"
    }
  }

  # Cluster access entry
  # To add the current caller identity as an administrator
  enable_cluster_creator_admin_permissions = true
 
  tags = {
    Environment = var.env
    Terraform   = "true"
  }
}




# data "aws_eks_cluster" "cluster" {
#   name = module.eks.cluster_name
#   depends_on = [ module.eks ]
# }

# data "aws_eks_cluster_auth" "cluster" {
#   name = local.name
#   depends_on = [ module.eks ]
# }


# provider "kubernetes" {
#   host                   = data.aws_eks_cluster.cluster.endpoint
#   cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
#   token                  = data.aws_eks_cluster_auth.cluster.token
  
# }



# module "eks_auth" {
#   source  = "terraform-aws-modules/eks/aws//modules/aws-auth"
#   version = "~> 20.0"

#   manage_aws_auth_configmap = true

#   aws_auth_users = [
#     {
#       userarn  = var.user_arn
#       username = var.user_name
#       groups   = ["system:masters"]
#     },
#   ]

#   providers = {
#     kubernetes = kubernetes
#   }
# }


resource "aws_eks_access_entry" "pc-access_entry" {
  cluster_name      = local.name
  principal_arn     = var.user_arn
  kubernetes_groups = ["Admin"]
  type              = "STANDARD"
  depends_on = [module.eks]
}

