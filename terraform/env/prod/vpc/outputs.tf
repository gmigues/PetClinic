
output vpc_id {
  value       = module.vpc_module.vpc_id
  description = "VPC id"
  sensitive   = false

}

output private_subnet_ids {
  value       = module.vpc_module.private_subnet_ids
  description = "Private subnet ids"
  sensitive   = false

}
