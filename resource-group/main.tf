resource "azurerm_resource_group" "this" {
  name     = var.name
  location = var.location
  tags     = var.tags
}

output "id" {
  value       = azurerm_resource_group.this.id
  description = "Resource Group ID"
}

output "name" {
  value       = azurerm_resource_group.this.name
  description = "Resource Group Name"
}
