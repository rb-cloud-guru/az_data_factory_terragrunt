#account connection string
output "blob_string" {
  value = azurerm_storage_account.sa.primary_connection_string
  sensitive = true
}

