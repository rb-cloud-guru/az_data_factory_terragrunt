#backend
remote_state {
    backend = "azurerm"
    config = {
        resource_group_name = "tfstorage"
        storage_account_name = "terraformrocks"
        container_name = "eznaidi"
        key = "${path_relative_to_include()}/terraform.tfstate"
    }
    generate = {
        path      = "backend.tf"
        if_exists = "overwrite_terragrunt"
  }
}

#var sthg like tfvars
inputs = {
    location = "eastus"
    rg_name = "azurefunc"
    storage_account_name = "Terraform"
    storage_account_tier = "Standard"
    storage_account_repl_type = "LRS"
    storage_account_container_name = "italia"
    storage_account_container_access_type = "private"
    key_vault_name = "srobolia"
    key_vault_sku = "standard"
    sql_admin_login = "monalisa"
    sql_srv_name = "holaki"
    sql_srv_version = "12.0"
    sql_db_name = "morocro"
    blob_key_name = "blobkey1"
    adf_name = "adftest5"
    adf_link_src = "adfconnectionsrc"
    adf_link_dst = "adfconnectiondst"
 }

 

