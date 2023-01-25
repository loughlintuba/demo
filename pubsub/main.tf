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

provider "google" {
  region = var.location
}
data "google_compute_default_service_account" "default" {
  project = var.project_id
}
module "pubsub" {
  source        = "terraform-google-modules/pubsub/google"
  version       = "5.0.0"
  project_id    = var.project_id
  topic         = var.topic
  topic_labels  = {
    foo_label = "foo_value"
    bar_label = "bar_value"
  }

  bigquery_subscriptions = [
    {
      name  = "example_subscription"
      table = "${var.project_id}:example_dataset.example_table"
    },
  ]

  depends_on = [
    google_bigquery_table.test
  ]

}

resource "google_bigquery_dataset" "test" {
  project    = var.project_id
  dataset_id = var.dataset_id
  location   = var.location
}

resource "google_bigquery_table" "test" {
  project             = var.project_id
  deletion_protection = false
  table_id            = var.table_id
  dataset_id          = google_bigquery_dataset.test.dataset_id

  schema = <<EOF
[
  {
    "name": "data",
    "type": "STRING",
    "mode": "NULLABLE",
    "description": "The data"
  }
]
EOF
}
