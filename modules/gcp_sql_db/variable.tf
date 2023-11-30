# Param
variable "project_name" {
  type = string
}

variable "sqladmin" {
  type = any
}

variable "cloud_resourcemanager" {
  type = any
}

# Variables
variable "db_version" {
  type    = string
  default = "POSTGRES_15"
}

variable "db_region" {
  type    = string
  default = "us-central1"
}

variable "db_deletion_protection" {
  type    = bool
  default = false
}

variable "db_machine_type" {
  type    = string
  default = "db-f1-micro"
}
