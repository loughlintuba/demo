dataset_id                 = "demo"
dataset_name               = "terraform_state"
description                = "demo"
project_id                 = "ultra-thought-374601"
location                   = "US"  #Multi-region
delete_contents_on_destroy = true

dataset_labels = {
  env      = "dev"
  billable = "true"
  owner    = "sedenoda"
}
