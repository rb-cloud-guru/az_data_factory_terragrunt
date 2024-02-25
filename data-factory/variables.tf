#region
variable location {
    description = "Location"
}

#rg name
variable rg_name {
    description = "Resource Group Name"
}

#adf 
variable "adf_name" {
  description = "adf name"
}

#adf link service src
variable "adf_link_src" {
  description = "adf link service source"
}

#adf link service dest
variable "adf_link_dst" {
  description = "adf link service destination"
}

#adf sql string
variable "adf_sql_string" {
  description = "adf sql string"
}

#adf blob string
variable "adf_blob_string" {
  description = "adf blob string"
  
}
