variable "vpc_cidr" {
  description = "The CIDR block for the VPC."
  type        = string
}

variable "vpc_name" {
  type = string
}

variable "public_Snet_cidr" {
  description = "The CIDR block for the Public Subnet."
  type        = string
}

variable "publicB_Snet_cidr" {
  description = "The CIDR block for the Public Subnet."
  type        = string
}

variable "privateB_Snet_cidr" {
  description = "The CIDR block for the Private Subnet."
  type        = string
}

variable "private_Snet_cidr" {
  description = "The CIDR block for the Private Subnet."
  type        = string
}


variable "availability_zone" {
  description = "The availability zone for the subnets"
  type        = string
}

variable "availability_zone_b" {
  description = "The availability zone for the subnets"
  type        = string
}

variable "env" {
  default = "Prod"
}