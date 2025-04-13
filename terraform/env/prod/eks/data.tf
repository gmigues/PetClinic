data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "petclinic-terraform-devops-2025"
    key    = "prod/vpc/terraform.tfstate"
    region = var.region
    profile = var.profile
  }

}
