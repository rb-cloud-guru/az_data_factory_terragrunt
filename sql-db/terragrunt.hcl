
include {
    path = find_in_parent_folders()
}

#currentpath
terraform {
    source = "../sql-db"
}

#module dependencies
dependencies {
    paths = ["../resource-group", "../key-vault"]
}

#dependencies in order
dependency key-vault {
    config_path = "../key-vault"
    skip_outputs = false 
    mock_outputs = {
        sql_admin_pwd = "habibi"
    }
}

#inputs
inputs = {
    sql_admin_pwd = dependency.key-vault.outputs.sql_admin_pwd
}
