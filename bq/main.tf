/**
 * Copyright 2022 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

module "bigquery" {
  source  = "terraform-google-modules/bigquery/google"
  version = "~> 5.4"
  dataset_id                 = var.dataset_id
  dataset_name               = var.dataset_name
  description                = var.description
  project_id                 = var.project_id
  location                   = var.location  
  delete_contents_on_destroy = var.delete_contents_on_destroy
  dataset_labels             = var.dataset_labels
  # google_credentials         = var.google_credentials
  tables = [
  {
    table_id           = "visitors",
    schema             = file("sample_bq_schema.json"),
    time_partitioning  = null,
    range_partitioning = null,
    expiration_time    = 2524604400000, # 2050/01/01
    clustering         = [],
    labels = {
      env      = "devops"
      billable = "true"
      owner    = "adalou"
    },
  }
 ]
}
