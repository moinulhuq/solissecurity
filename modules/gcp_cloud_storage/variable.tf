# Param
variable "storage" {
  type = any
}

variable "cloud_resourcemanager" {
  type = any
}

# Variables
variable "buckt_name" {
  type    = string
  default = "moin-test-bucket"
}

variable "buckt_location" {
  type    = string
  default = "US"
}

variable "buckt_storage_class" {
  type    = string
  default = "MULTI_REGIONAL"
}

variable "buckt_force_destroy" {
  type    = bool
  default = true
}

variable "buckt_uniform_bucket_level_access" {
  type    = bool
  default = false
}