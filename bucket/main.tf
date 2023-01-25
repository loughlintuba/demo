/**
 * Copyright 2020 Google LLC
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

module "cloud-storage" {
  source  = "terraform-google-modules/cloud-storage/google"
  version = "3.4.1"

  names      = var.names
  project_id = var.project_id
  location   = "us-east1"
  set_admin_roles = var.set_admin_roles
  prefix = var.prefix
  # admins = var.admins
  versioning = var.versioning
  # bucket_admins = var.bucket_admins

  lifecycle_rules = [{
    action = {
      type = "Delete"
    }
    condition = {
      age            = 365
      with_state     = "ANY"
      matches_prefix = var.project_id
    }
  }]


}
