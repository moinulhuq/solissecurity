# Param
variable "project_id" {
  type = string
}

# Variables
variable "disable_dependent_services" {
  type        = bool
  default     = false
}

variable "disable_on_destroy" {
  type        = bool
  default     = false
}

