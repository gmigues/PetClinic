module "vpc_module" {
  source              = "../../../modules/vpc"
  vpc_cidr            = var.vpc_cidr
  public_Snet_cidr    = var.public_Snet_cidr
  private_Snet_cidr   = var.private_Snet_cidr
  privateB_Snet_cidr  = var.privateB_Snet_cidr
  availability_zone   = var.availability_zone
  availability_zone_b = var.availability_zone_b
  publicB_Snet_cidr   = var.publicB_Snet_cidr
  vpc_name            = var.vpc_name
  
}






