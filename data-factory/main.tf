#resource provider
provider "azurerm" {
	features {}
}

#create Azure Data Factory
resource "azurerm_data_factory" "adf" {
  name                = var.adf_name
  location            = var.location
  resource_group_name = var.rg_name
}

#create Azure Data factory SQL Src Link 
resource "azurerm_data_factory_linked_service_azure_sql_database" "source" {
  name              = var.adf_link_src
  data_factory_id   = azurerm_data_factory.adf.id
  connection_string = var.adf_sql_string
  #sql string == 
}

#create Azure Data Factory Blob Dest Link
resource "azurerm_data_factory_linked_service_azure_blob_storage" "destination" {
  name              = var.adf_link_dst
  data_factory_id   = azurerm_data_factory.adf.id
  connection_string = var.adf_blob_string
  #blob  string == BLOB primary key 
}

