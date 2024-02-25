
#root location
include {
    path = find_in_parent_folders()
}

#currentpath
terraform {
    source = "../key-vault"
}

#dependencies
dependencies {
    paths = ["../resource-group", "../storage-account"]
}

#dependency 
dependency storage-account {
    config_path = "../storage-account"
    skip_outputs = false 
    mock_outputs = {
        blob_string = "habibi50"
    }
}

#inputs
inputs = {
    blob_key_value = dependency.storage-account.outputs.blob_string
}