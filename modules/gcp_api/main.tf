# Module Enable API
resource "google_project_service" "compute" {
  project = var.project_id
  service = "compute.googleapis.com"
  disable_dependent_services = var.disable_dependent_services
  disable_on_destroy = var.disable_on_destroy
}

resource "google_project_service" "cloud_resourcemanager" {
  project = var.project_id
  service = "cloudresourcemanager.googleapis.com"
  disable_dependent_services = var.disable_dependent_services
  disable_on_destroy = var.disable_on_destroy
}

resource "google_project_service" "storage" {
  project = var.project_id
  service = "storage.googleapis.com"
  disable_dependent_services = var.disable_dependent_services
  disable_on_destroy = var.disable_on_destroy
}

resource "google_project_service" "sqladmin" {
  project = var.project_id
  service = "sqladmin.googleapis.com"
  disable_dependent_services = var.disable_dependent_services
  disable_on_destroy = var.disable_on_destroy
}

