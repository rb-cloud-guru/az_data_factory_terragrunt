
#tf
terraform {
  #backend "azurerm" {}
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.6.0"
    }
  }
}

provider "azurerm" {
	features {}
}

#configure the Terraform Random Provider
provider "random" {}

#random string
resource "random_id" "rd" {
  keepers = {
    # Generate a new ID only when a new resource group is defined
    resource_group = var.rg_name
  }
  byte_length = 3
}

#create a storage account
resource "azurerm_storage_account" "sa" {
  name                     = "${lower(var.storage_account_name)}${random_id.rd.hex}"
  resource_group_name      = var.rg_name
  location                 = var.location
  account_tier             = var.storage_account_tier
  account_replication_type = var.storage_account_repl_type

#tags
  tags = {
    environment = "dev"
  }
}

#create storage account container
resource "azurerm_storage_container" "cont" {
  name                  = var.storage_account_container_name
  storage_account_name  = azurerm_storage_account.sa.name
  container_access_type = var.storage_account_container_access_type
}
