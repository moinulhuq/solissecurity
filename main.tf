/*
  Developed by: Md Moinul Huq
  Email: moinulhuq@gmail.com
*/

terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.7.0"
    }
  }
}

# provider
provider "google" {
  credentials = file("./solis-406601-bc7a265e100a.json")
  project     = var.project_id
  region      = var.project_region
  zone        = var.project_zone
}

# Module gcp_api
module "gcp_api" {
  source      = "./modules/gcp_api"
  project_id  = var.project_id
}

# Module gcp_network
module "gcp_network" {
  source                = "./modules/gcp_network"
  project_name          = var.project_name
  compute               = module.gcp_api.compute
  cloud_resourcemanager = module.gcp_api.cloud_resourcemanager
}

# Module gcp_vm
module "gcp_vm" {
  source                = "./modules/gcp_vm"
  project_name          = var.project_name
  vpc_network           = module.gcp_network.vpc_network
  vpc_public_subnet     = module.gcp_network.vpc_public_subnet
  compute               = module.gcp_api.compute
  cloud_resourcemanager = module.gcp_api.cloud_resourcemanager
}

# Module gcp_cloud_storage
module "gcp_cloud_storage" {
  source                = "./modules/gcp_cloud_storage"
  storage               = module.gcp_api.storage
  cloud_resourcemanager = module.gcp_api.cloud_resourcemanager
}

# Module gcp_sql_db
module "gcp_sql_db" {
  source                = "./modules/gcp_sql_db"
  project_name          = var.project_name
  sqladmin               = module.gcp_api.storage
  cloud_resourcemanager = module.gcp_api.cloud_resourcemanager
}


