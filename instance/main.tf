/**
 * Copyright 2018 Google LLC
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

data "google_compute_default_service_account" "default" {
  project = var.project_id
}

data "google_compute_subnetwork" "subnet" {
  project = var.project_id  
  name = "default"
  region = var.region
}

module "instance_template" {
  source  = "terraform-google-modules/vm/google//modules/instance_template"
  version = "8.0.0"
  region          = var.region
  project_id      = var.project_id
  subnetwork      = data.google_compute_subnetwork.subnet.id
  service_account = {
    email  = data.google_compute_default_service_account.default.email
    scopes = ["cloud-platform"]
  }
}

module "compute_instance" {
  source  = "terraform-google-modules/vm/google//modules/compute_instance"
  version = "8.0.0"
  region              = var.region
  zone                = var.zone
  num_instances       = var.num_instances
  hostname            = var.hostname
  instance_template   = module.instance_template.self_link
  deletion_protection = false

  # access_config = [{
  #   nat_ip       = var.nat_ip
  #   network_tier = var.network_tier
  # }, ]
}
