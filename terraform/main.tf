module "vpc_module" {
  source = "./modules/vpc"
  vpc_cidr           = var.vpc_cidr
  public_Snet_cidr   = var.public_Snet_cidr
  private_Snet_cidr  = var.private_Snet_cidr
  privateB_Snet_cidr = var.privateB_Snet_cidr
  availability_zone  = var.availability_zone
  availability_zone_b = var.availability_zone_b
  publicB_Snet_cidr = var.publicB_Snet_cidr
}

# module "eks_module" {
#   source       = "./modules/eks"
#   vpc_id = module.vpc_module.vpc_id
#   subnet_ids = module.vpc_module.private_subnet_ids

# }


# # Grupo de seguridad para los nodos de EKS
# resource "aws_security_group" "eks_nodes_sg" {
#   name        = "eks-nodes-sg"
#   description = "Security group for EKS nodes"
#   vpc_id      = module.vpc_module.vpc_id # Asume que tu módulo VPC tiene una salida para la VPC ID

#   tags = {
#     Name = "EKS Nodes Security Group"
#   }
# }

# # Reglas de seguridad para el grupo de seguridad de EKS
# resource "aws_security_group_rule" "eks_nodes_ingress_self" {
#   description       = "Allow node to node communication"
#   type              = "ingress"
#   from_port         = 0
#   to_port           = 0
#   protocol          = "-1"
#   security_group_id = aws_security_group.eks_nodes_sg.id
#   self              = true
# }

# resource "aws_security_group_rule" "eks_nodes_egress" {
#   description       = "Allow all outbound traffic"
#   type              = "egress"
#   from_port         = 0
#   to_port           = 0
#   protocol          = "-1"
#   security_group_id = aws_security_group.eks_nodes_sg.id
#   cidr_blocks       = ["0.0.0.0/0"]
# }

