terraform {
  backend "azurerm" {
    resource_group_name   = "rg-tfstate-dev"
    storage_account_name  = "sttfstatedev"
    container_name        = "tfstate"
    key                   = "staging.terraform.tfstate"
  }
}
