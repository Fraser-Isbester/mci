# Infra/Terraform Directory
This Directory contains terraform that bootstraps the infrastructure. Most of the ifnrastructure is managed by by the Control Cluster.

## Bootstrapping the Infrastructure
1. Create a new Org bound Google Cloud Project `gcloud projects create my-project`
2. Enable Application Default Credentials `gcloud auth application-default login`
3. Copy terraform.tfvars.in to terraform.tfvars and update the values. `cp terraform.tfvars.in terraform.tfvars`
4. Run `terraform init` to initialize the terraform project
5. Bootstrap the infrastructure
    - `terraform apply --target google_project_service.project` to enable the required services (required for a complete apply)
    - `terraform apply`
