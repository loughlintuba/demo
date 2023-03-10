# Simple Example

This example illustrates how to use the `kms` module.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| keyring | Keyring name. | `string` | n/a | yes |
| keys | Key names. | `list(string)` | `[]` | no |
| location | Location for the keyring. | `string` | `"global"` | no |
| project\_id | The ID of the project in which to provision resources. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| keyring | The name of the keyring. |
| keys | List of created kkey names. |
| location | The location of the keyring. |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

To provision this example, run the following from within this directory:
- `source set-env.sh` to initilize backend 

- `terraform init` to get the plugins

- `terraform plan -var-file data-general/data-gen-us-cent-demo-dev.tfvars ` to see the infrastructure plan

- `terraform apply -var-file data-general/data-gen-us-cent-demo-dev.tfvars -auto-approve` to apply the infrastructure build

- `terraform destroy -var-file data-general/data-gen-us-cent-demo-dev.tfvars -auto-approve` to destroy the built infrastructure