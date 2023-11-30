output "vpc_network" {
  value = google_compute_network.vpc_network
}

output "vpc_public_subnet" {
  value = google_compute_subnetwork.vpc_public_subnet
}

output "vpc_pprivate_subnet" {
  value = google_compute_subnetwork.vpc_private_subnet
}
