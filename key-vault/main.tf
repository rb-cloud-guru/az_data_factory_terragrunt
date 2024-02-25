
#tf required when you use Terragrunt
#terraform {
#  backend "azurerm" {}
#}

#resource provider
provider "azurerm" {
	features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
  }
}

#access the config of the azurem provider 
data "azurerm_client_config" "current" {}

#keyvault creation
resource "azurerm_key_vault" "kv" {
  name                        = var.key_vault_name
  location                    = var.location
  resource_group_name         = var.rg_name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false
  sku_name = var.key_vault_sku

}

  #keyvault access policy
  resource "azurerm_key_vault_access_policy" "pol" {
    key_vault_id = azurerm_key_vault.kv.id
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    secret_permissions = [
      "Get", "List", "Set", "Delete", "Purge"
    ]
  }

#create a sql admin
resource "random_password" "sqlusr" {
  length = 8
  special = true
}

#create sql Admin Secret
resource "azurerm_key_vault_secret" "sqlpwd" {
  name         = var.sql_admin_login
  value        = random_password.sqlusr.result
  key_vault_id = azurerm_key_vault.kv.id
   
  #dependency on kv explicit
  depends_on = [
    azurerm_key_vault_access_policy.pol
  ]
}

#create Blob Storage Primary key 
resource "azurerm_key_vault_secret" "blob_key" {
  name         = var.blob_key_name
  value        = var.blob_key_value
  key_vault_id = azurerm_key_vault.kv.id
  #dependency on kv explicit
  depends_on = [
    azurerm_key_vault_access_policy.pol
  ]
}



