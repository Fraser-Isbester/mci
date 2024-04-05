resource "google_project_service" "project" {
  for_each = toset([
    "cloudresourcemanager.googleapis.com",
    # Needed for GKE
    "container.googleapis.com",
    "compute.googleapis.com",
    "gkehub.googleapis.com",
    "mesh.googleapis.com",
    # Needed for IAP
    "iap.googleapis.com",
    "beyondcorp.googleapis.com"
  ])
  project                    = data.google_project.main.project_id
  service                    = each.value
  disable_dependent_services = true
}
