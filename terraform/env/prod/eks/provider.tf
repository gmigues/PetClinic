
provider "aws" {
  profile = var.profile
  region  = var.region
}

terraform {
  backend "s3" {
    bucket  = "petclinic-terraform-devops-2025"
    key     = "prod/eks/terraform.tfstate"
    region  = "us-east-1"
    profile = "personal"

  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.93.0"
    }
  }
}


