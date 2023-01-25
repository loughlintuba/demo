# Simple Example

This example illustrates how to use the `simple-bucket` submodule.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| project\_id | The ID of the project in which to provision resources. | `string` | n/a | yes |

## Outputs

No output.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

To provision this example, run the following from within this directory:

- `source set-env.sh` to initilize backend 

- `terraform init` to get the plugins

- `terraform plan -var-file data-general/data-gen-us-cent-demo-dev.tfvars` to see the infrastructure plan

- `terraform apply -var-file data-general/data-gen-us-cent-demo-dev.tfvars -auto-approve` to apply the infrastructure build

- `terraform destroy -var-file data-general/data-gen-us-cent-demo-dev.tfvars -auto-approve` to destroy the built infrastructure
