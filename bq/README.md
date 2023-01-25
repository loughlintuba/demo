# terraform-google-bigquery basic_bq
The basic_bq example uses the root terraform-google-bigquery module to deploy a single dataset and a table with a basic schema. This example is a good reference to understand and test the module usage.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| delete\_contents\_on\_destroy | (Optional) If set to true, delete all the tables in the dataset when destroying the resource; otherwise, destroying the resource will fail if tables are present. | `bool` | `null` | no |
| project\_id | Project where the dataset and table are created. | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| bigquery\_dataset | Bigquery dataset resource. |
| bigquery\_tables | Map of bigquery table resources being provisioned. |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Setup
Update the contents of `terraform.tfvars` to match your test environment.

- `source set-env.sh` to initilize backend 

- `terraform init` to get the plugins

- `terraform plan -var-file data-federated-financial/data-fed-fin-demo-bq-dev.tfvars  -auto-approve ` to see the infrastructure plan

- `terraform apply -var-file data-federated-financial/data-fed-fin-demo-bq-dev.tfvars  -auto-approve` to apply the infrastructure build

- `terraform destroy -var-file ata-federated-financial/data-fed-fin-demo-bq-dev.tfvars   -auto-approve` to destroy the built infrastructure