dataset_id                 = "ada_2020"
dataset_name               = "terraform_state"
description                = "demo"
project_id                 = "ultra-thought-374601"
location                   = "US"  #Multi-region
delete_contents_on_destroy = true
google_credentials         = "credentials.json"
dataset_labels = {
  env      = "prod"
  billable = "true"
  owner    = "sedenoda"
}
