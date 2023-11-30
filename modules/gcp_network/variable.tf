# Param
variable "project_name" {
  type = string
}

variable "compute" {
  type = any
}

variable "cloud_resourcemanager" {
  type = any
}

# Variables
variable "apc_auto_create_subnetworks" {
  type        = bool
  default     = false
}

# Private Subnet
variable "private_ip_cidr_range" {
  type        = string
  default     = "10.0.0.0/20"
}

variable "private_subnet_region" {
  type        = string
  default     = "us-central1"
}

# Public Subnet
variable "public_ip_cidr_range" {
  type        = string
  default     = "10.0.16.0/20"
}

variable "public_subnet_region" {
  type        = string
  default     = "us-central1"
}

# Router
variable "router_region" {
  type        = string
  default     = "us-central1"
}

# firewall
variable "firewall_ports" {
  type        = list(string)
  default     = ["80", "443"]
}
