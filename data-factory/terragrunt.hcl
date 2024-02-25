
#root location
include {
    path = find_in_parent_folders()
}

#currentpath
terraform {
    source = "../data-factory"
}

#dependency
dependencies {
    paths = ["../resource-group", "../sql-db", "../key-vault"]
}

#dependencies in order
dependency sql-db {
    config_path = "../sql-db"
    skip_outputs = false 
    mock_outputs = {
        sql_string = "habibi23"
    }
}

dependency key-vault {
    config_path = "../key-vault"
    skip_outputs = false 
    mock_outputs = {
        blob_key = "habibi1980"
    }
}


#inputs
    inputs =  {
        adf_sql_string = dependency.sql-db.outputs.sql_string
        adf_blob_string = dependency.key-vault.outputs.blob_key
    }