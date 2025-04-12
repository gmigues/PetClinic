output "cluster_name" {
  description = "Nombre del cluster EKS"
  value       = module.eks_module.cluster_name
}

output "kubeconfig_command" {
  description = "Comando para actualizar el kubeconfig"
  value       = "aws eks update-kubeconfig --region ${var.region} --name ${module.eks_module.cluster_name}"
}
