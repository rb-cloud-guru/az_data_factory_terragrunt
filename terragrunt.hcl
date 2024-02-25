#backend
remote_state {
    backend = "azurerm"
    config = {
        resource_group_name = "rg"
        storage_account_name = "terraformrocks"
        container_name = "tfcont"
        key = "${path_relative_to_include()}/terraform.tfstate"
    }
    generate = {
        path      = "backend.tf"
        if_exists = "overwrite_terragrunt"
  }
}

#var sthg like tfvars
inputs = {
    location = "westus"
    rg_name = "rg"
    storage_account_name = ""
    storage_account_tier = ""
    storage_account_repl_type = ""
    storage_account_container_name = ""
    storage_account_container_access_type = ""
    key_vault_name = ""
    key_vault_sku = ""
    sql_admin_login = ""
    sql_srv_name = ""
    sql_srv_version = ""
    sql_db_name = ""
    blob_key_name = ""
    adf_name = ""
    adf_link_src = ""
    adf_link_dst = ""
 }

 

