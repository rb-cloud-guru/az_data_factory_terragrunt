#region
variable location {
    description = "Location"
}

#rg name
variable rg_name {
    description = "Resource Group Name"
}

#sql server 
variable "sql_srv_name" {
  description = "Name of the sql server"
}

#sql server version
variable "sql_srv_version" {
  description = "sql server version"
}

#sql server admin login
variable "sql_admin_login" {
  description = "sql server admin"
}

#sql server admin password
variable "sql_admin_pwd" {
  description = "sql server password"
}

#sql db name
variable "sql_db_name" {
  description = "sql db name"
}