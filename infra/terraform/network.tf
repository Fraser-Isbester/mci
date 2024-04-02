locals {
  network_name       = "${data.google_project.project.project_id}-network"
  subnet_name        = "${data.google_project.project.project_id}-subnet"
  master_subnet_name = "${data.google_project.project.project_id}-master-subnet"
  pods_range_name    = "${data.google_project.project.project_id}-ip-range-pods"
  svc_range_name     = "${data.google_project.project.project_id}-ip-range-svc"
  subnet_names       = [for subnet_self_link in module.gcp-network.subnets_self_links : split("/", subnet_self_link)[length(split("/", subnet_self_link)) - 1]]
}

module "gcp-network" {
  source  = "terraform-google-modules/network/google"
  version = ">= 9.0"

  project_id   = data.google_project.project.project_id
  network_name = local.network_name

  subnets = [
    {
      subnet_name   = local.subnet_name
      subnet_ip     = "10.0.128.0/28"
      subnet_region = var.region
    },
    {
      subnet_name   = local.master_subnet_name
      subnet_ip     = "10.0.128.16/28"
      subnet_region = var.region
    },
  ]

  secondary_ranges = {
    (local.subnet_name) = [
      {
        range_name    = local.pods_range_name
        ip_cidr_range = "192.168.0.0/18"
      },
      {
        range_name    = local.svc_range_name
        ip_cidr_range = "192.168.64.0/18"
      },
    ]
  }
}
