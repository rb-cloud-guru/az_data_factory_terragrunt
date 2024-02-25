#sql admin
output "sql_admin_pwd" {
  value = azurerm_key_vault_secret.sqlpwd.value
  sensitive = true
}

#Blob Primary Key
output "blob_key" {
  value = azurerm_key_vault_secret.blob_key.value
  sensitive = true
}