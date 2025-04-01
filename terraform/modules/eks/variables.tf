# variable "cluster_name" {
#   description = "The name of the EKS cluster."
#   type        = string
# }


variable "subnet_ids" {
  description = "A list of subnet IDs to launch the EKS cluster in."
  type        = list(string)
}


# variable "node_security_group_id" {
#   description = "The security group ID for the EKS nodes."
#   type        = string
# }

# variable "ssh_key" {
#   type        = string
# }

variable "vpc_id" {
  type = string
  
}