# Bigquery Example

This example illustrates how to use the `pubsub` module.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| project\_id | The project ID to manage the Pub/Sub resources | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| project\_id | The project ID |
| topic\_labels | The labels of the Pub/Sub topic created |
| topic\_name | The name of the Pub/Sub topic created |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Requirements

The following sections describe the requirements which must be met in
order to invoke this example. The requirements of the
[root module][root-module-requirements] must be met.

## Usage

To provision this example, populate `terraform.tfvars` with the [required variables](#inputs) and run the following commands within
this directory:
- `source set-env.sh` to initilize backend 

- `terraform init` to get the plugins

- `terraform plan -var-file data-general/data-gen-us-cent-demo-dev.tfvars` to see the infrastructure plan

- `terraform apply -var-file data-general/data-gen-us-cent-demo-dev.tfvars -auto-approve` to apply the infrastructure build

- `terraform destroy -var-file data-general/data-gen-us-cent-demo-dev.tfvars -auto-approve` to destroy the built infrastructure