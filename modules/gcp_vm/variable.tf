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

variable "vpc_network" {
  type = any
}

variable "vpc_public_subnet" {
  type = any
}

# Variables
variable "vm_machine_type" {
  type        = string
  default     = "e2-medium"
}

variable "vm_zone" {
  type        = string
  default     = "us-central1-c"
}

variable "vm_image" {
  type        = string
  default     = "debian-cloud/debian-12"
}

variable "vm_tag" {
  type        = string
  default     = "web"
}

variable "vm_user_data" {
  type        = string
  default     = <<EOF
                    #!/bin/bash
                    sudo apt-get -y update && sudo apt-get -y install nginx
                    sudo systemctl start nginx
                EOF
}

