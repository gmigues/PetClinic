
module "eks_module" {
  source     = "../../../modules/eks"
  vpc_id     = data.terraform_remote_state.vpc.outputs.vpc_id
  subnet_ids = data.terraform_remote_state.vpc.outputs.private_subnet_ids
  user_arn   = var.user_arn
  user_name  = var.user_name
  cluster_name = var.cluster_name

}


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

