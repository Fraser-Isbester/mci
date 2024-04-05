module "gke" {
  source  = "terraform-google-modules/kubernetes-engine/google//modules/beta-autopilot-private-cluster"
  version = "~> 30"

  project_id                      = data.google_project.main.project_id
  name                            = "control-cluster-001"
  regional                        = true
  region                          = var.region
  network                         = module.gcp-network.network_name
  subnetwork                      = local.subnet_names[index(module.gcp-network.subnets_names, local.subnet_name)]
  ip_range_pods                   = local.pods_range_name
  ip_range_services               = local.svc_range_name
  release_channel                 = "REGULAR"
  enable_vertical_pod_autoscaling = true
  enable_private_endpoint         = true
  enable_private_nodes            = true
  deletion_protection             = false
  enable_cost_allocation          = true
  network_tags                    = ["gke", "control-cluster-001"]
  fleet_project                   = data.google_project.main.project_id

  master_authorized_networks = [{
    cidr_block   = "10.60.0.0/17"
    display_name = "VPC"
  }]
}
