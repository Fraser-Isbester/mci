# Infra/Terraform Directory
This Directory contains terraform that bootstraps the infrastructure. Most of the ifnrastructure is managed by by the Control Cluster.

## Bootstrapping the Infrastructure
1. Create a new Google Cloud Project `gcloud projects create my-mci-project`
1. Create a terraform.tfvars file in the infra/terraform directory with the following line: `project_id = "my-mci-project"`
3. Run `terraform init` to initialize the terraform project
4. Run `terraform apply` to create the infrastructure
5. Update `main.tf` backend configuration to match your new GCS bucket
6. Run `terraform init` again to reinitialize the project w/ the new backend configuration
