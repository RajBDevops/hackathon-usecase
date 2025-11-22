module "rg" {
  source    = "../../modules/resource-group"
  name      = "myproject-${var.environment}-rg"
  location  = var.location
  tags      = var.tags
}

# Calling modules
module "network" {
  source    = "../../modules/network"
  environment = var.environment
  location    = var.location
  resource_group_name = module.rg.name
  tags         = var.tags
}
