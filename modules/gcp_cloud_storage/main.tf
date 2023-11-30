# Module cloud-storage
resource "google_storage_bucket" "static-site" {
  name                        = var.buckt_name
  location                    = var.buckt_location
  storage_class               = var.buckt_storage_class
  force_destroy               = var.buckt_force_destroy
  uniform_bucket_level_access = var.buckt_uniform_bucket_level_access
  depends_on = [
    var.cloud_resourcemanager,
    var.storage
  ]
}
