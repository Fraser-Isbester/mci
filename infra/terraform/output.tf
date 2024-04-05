
# The control cluster.
output "cluster" {
  value       = module.gke
  description = "The control cluster."
  sensitive   = true
}

# The network.
output "network" {
  value       = module.gcp-network
  description = "The GCP Network."
  sensitive   = true
}
