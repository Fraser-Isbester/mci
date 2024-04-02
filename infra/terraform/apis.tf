resource "google_project_service" "project" {
  for_each = toset([
    "cloudresourcemanager.googleapis.com",
    "container.googleapis.com",
    "compute.googleapis.com",
    "gkehub.googleapis.com",
    "mesh.googleapis.com"
  ])
  project                    = data.google_project.project.project_id
  service                    = each.value
  disable_dependent_services = true
}
