#!/bin/bash


DIR=$(pwd)
cat << EOF > "$DIR/backend.tf"
terraform {
  backend "gcs" {
    bucket  = "ultra-thought-374601-terraform-state-tiffany"
    prefix  = "$DIR"
  }
}
EOF
cat "$DIR/backend.tf"

GOOGLE_APPLICATION_CREDENTIALS="$DIR/credentials.json"
export GOOGLE_APPLICATION_CREDENTIALS