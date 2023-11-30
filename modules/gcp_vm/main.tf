# Module vm
resource "google_compute_instance" "web_compute_instance" {
  name         = "${var.project_name}-web"
  machine_type = var.vm_machine_type
  zone         = var.vm_zone
  tags         = [var.vm_tag]

  boot_disk {
    initialize_params {
      image = var.vm_image
      labels = {
        my_label = var.vm_tag
      }
    }
  }

  network_interface {
    network    = var.vpc_network.self_link
    subnetwork = var.vpc_public_subnet.self_link
    access_config {
      // Ephemeral public IP
    }
  }

  metadata_startup_script = var.vm_user_data

  depends_on = [
    var.vpc_network,
    var.vpc_public_subnet,
    var.compute, 
    var.cloud_resourcemanager
  ]

}
