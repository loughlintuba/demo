# Single Service Account

This example illustrates how to use the `service-accounts` module to generate a single service account.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| prefix | Prefix applied to service account names. | `string` | `""` | no |
| project\_id | The ID of the project in which to provision resources. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| email | The service account email. |
| iam\_email | The service account IAM-format email. |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

To provision this example, run the following from within this directory:
- `source set-env.sh` to initilize backend 

- `terraform init` to get the plugins

- `terraform plan -var-file data-general/data-gen-us-cent-demo-dev.tfvars` to see the infrastructure plan

- `terraform apply -var-file data-general/data-gen-us-cent-demo-dev.tfvars -auto-approve` to apply the infrastructure build

- `terraform destroy -var-file data-general/data-gen-us-cent-demo-dev.tfvars -auto-approve` to destroy the built infrastructure