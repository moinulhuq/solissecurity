# Module network
resource "google_compute_network" "vpc_network" {
  name                    = "${var.project_name}-vpc"
  description             = "vpc for ${var.project_name}"
  auto_create_subnetworks = var.apc_auto_create_subnetworks
}

resource "google_compute_subnetwork" "vpc_private_subnet" {
  name          = "${var.project_name}-private-subnet"
  description   = "private subnet for ${var.project_name}"
  ip_cidr_range = var.private_ip_cidr_range
  region        = var.private_subnet_region
  network       = google_compute_network.vpc_network.id
  depends_on    = [google_compute_network.vpc_network, 
                  var.compute, 
                  var.cloud_resourcemanager
                ]
}

resource "google_compute_subnetwork" "vpc_public_subnet" {
  name          = "${var.project_name}-public-subnet"
  description   = "public subnet for ${var.project_name}"
  ip_cidr_range = var.public_ip_cidr_range
  region        = var.public_subnet_region
  network       = google_compute_network.vpc_network.id
  depends_on    = [google_compute_network.vpc_network, 
                  var.compute, 
                  var.cloud_resourcemanager
                ]
}

resource "google_compute_router" "router" {
  name        = "${var.project_name}-router"
  description = "router for ${var.project_name}"
  region      = var.router_region
  network     = google_compute_network.vpc_network.id
  depends_on = [
    google_compute_network.vpc_network,
    google_compute_subnetwork.vpc_private_subnet
  ]
}

resource "google_compute_router_nat" "router_nat" {
  name                               = "${var.project_name}-router-nat"
  router                             = google_compute_router.router.name
  region                             = google_compute_router.router.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"

  subnetwork {
    name                    = "${var.project_name}-private-subnet"
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }

  depends_on = [
    google_compute_network.vpc_network,
    google_compute_subnetwork.vpc_private_subnet,
    google_compute_router.router
  ]
}

resource "google_compute_firewall" "firewall" {
  name        = "${var.project_name}-web-firewall"
  description = "Network firewall for ${var.project_name}"
  network     = google_compute_network.vpc_network.id
  priority    = 1000

  allow {
    protocol = "tcp"
    ports    = var.firewall_ports
  }

  target_tags   = ["web"]
  source_ranges = ["0.0.0.0/0"]
  depends_on = [
    google_compute_network.vpc_network
  ]
}