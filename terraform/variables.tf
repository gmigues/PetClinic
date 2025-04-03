variable "profile" {
  default = "personal"
}

variable "region" {
  default = "us-east-1"
}

variable "vpc_name" {
  default = "petClinic_VPC"
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_Snet_cidr" {
  description = "The CIDR block for the Public Subnet."
  type        = string
  default     = "10.0.1.0/24"
}

variable "publicB_Snet_cidr" {
  description = "The CIDR block for the Public Subnet."
  type        = string
  default     = "10.0.4.0/24"
}

variable "private_Snet_cidr" {
  description = "The CIDR block for the Private Subnet."
  type        = string
  default     = "10.0.2.0/24"
}

variable "privateB_Snet_cidr" {
  description = "The CIDR block for the Private Subnet."
  type        = string
  default     = "10.0.3.0/24"
}


variable "availability_zone" {
  description = "The availability zone for the subnets"
  type        = string
  default     = "us-east-1a"
}

variable "availability_zone_b" {
  description = "The availability zone for the subnets"
  type        = string
  default     = "us-east-1b"
}

# variable "cluster_name" {
#   description = "The name of the EKS cluster."
#   type        = string
#   default = "gms-cluster"
# }


# variable "ssh_key" {
#   type        = string
#   default = "Dev"
# }
#
#
#

variable "user_name" {
  type    = string
  default = "gonzalo"
}

variable "user_arn" {
  type    = string
  default = "arn:aws:iam::976265146601:user/gonzalo"
}

variable "env" {
  type    = string
  default = "pc-prod"
}