terraform {
  required_version = ">= 1.7"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.23.0"
    }
  }

}

# Define the Google Cloud provider.
provider "google" {
  project = var.project_id
  region  = var.region
}

data "google_project" "main" {}

# # Terraform backend bucket.
# resource "google_storage_bucket" "terraform" {
#   name          = "${data.google_project.main.project_id}-terraform"
#   location      = "US"
#   force_destroy = true
#   versioning { enabled = true }
#   uniform_bucket_level_access = true
#   labels = {
#     managed-by = "terraform"
#   }
# }
