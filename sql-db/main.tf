
#tf
#terraform {
#  backend "azurerm" {}
#}

#resource provider
provider "azurerm" {
	features {}
}

#create a SQL Server
resource "azurerm_mssql_server" "sql_srv" {
  name                         = var.sql_srv_name
  resource_group_name          = var.rg_name 
  location                     = var.location
  version                      = var.sql_srv_version
  administrator_login          = var.sql_admin_login
  administrator_login_password = var.sql_admin_pwd
}

#create a sql db
resource "azurerm_mssql_database" "sql_db" {
  name      = var.sql_db_name
  server_id = azurerm_mssql_server.sql_srv.id
}

