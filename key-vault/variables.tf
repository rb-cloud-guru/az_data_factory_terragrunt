#region
variable location {
    description = "Location"
}

#rg name
variable rg_name {
    description = "Resource Group Name"
}

#keyvault name
variable key_vault_name {
    description = "key vault name"
}

#keyvault sku
variable key_vault_sku {
    description = "Key vault sku"
}

#keyvault sql admin
variable sql_admin_login {
    description = "Name of the sql admin"
}

#keyvault blob key
variable "blob_key_name" {
    description = "Name of the Blob key name"
}

#keyvault blob key value
variable "blob_key_value" {
    description = "Blob key primary" 
}

#sql string name
#variable "sql_string_name" {
#    description = "sql string name"
#}

#sql string value
#variable "sql_string_value" {
#    description = "sql string value"
#}