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

variable "project_id" {
  description = "The ID of the project in which to provision resources."
  type        = string
}


variable "prefix" {
  description = "Prefix used to generate the bucket name."
  type        = string
  default     = ""
}

variable "names" {
  description = "Bucket name suffixes."
  type        = list(string)
}
variable "location" {
  description = "Bucket location."
  type        = string
  default     = "EU"
}

variable "randomize_suffix" {
  description = "Adds an identical, but randomized 4-character suffix to all bucket names"
  type        = bool
  default     = false
}

# variable "bucket_admins" {
#   description = "Map of lowercase unprefixed name => comma-delimited IAM-style per-bucket admins."
#   type        = map(string)
#   default     = {}
# }
variable "versioning" {
  description = "Optional map of lowercase unprefixed name => boolean, defaults to false."
  type        = map(bool)
  default     = {}
}

# variable "admins" {
#   description = "IAM-style members who will be granted roles/storage.objectAdmin on all buckets."
#   type        = list(string)
#   default     = []
# }

variable "set_admin_roles" {
  description = "Grant roles/storage.objectAdmin role to admins and bucket_admins."
  type        = bool
  default     = false
}