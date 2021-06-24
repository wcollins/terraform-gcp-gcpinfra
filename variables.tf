variable "region" {
  description = "GCP region"
  type        = string
}

variable "vpc_name" {
  description = "VPC name"
  type        = string
}

variable "instance_names" {
  description = "List of GCP instances"
  type        = list(string)
}

variable "subnet_names" {
  description = "List of subnet names"
  type        = list(string)
}

variable "subnet_prefixes" {
  description = "List of subnet prefixes"
  type        = list(string)
}

variable "routing_mode" {
  description = "GCP network-wide routing mode"
  type        = string
  default     = "REGIONAL"
}

variable "description" {
  description = "Resource description"
  type        = string
  default     = "Managed by Terraform"
}

variable "project_id" {
  description = "GCP - Project ID"
  type        = string
}

variable "ssh_user" {
  description = "Default user"
  type        = string
  default     = "ubuntu"
}

variable "ssh_key" {
  description = "Public key data"
  type        = string
}

variable "machine_type" {
  description = "GCP - machine type"
  type        = string
  default     = "e2-micro"
}

variable "boot_disk_image" {
  description = "GCP - boot disk image"
  type        = string
  default     = "ubuntu-os-cloud/ubuntu-1804-lts"
}

variable "boot_disk_type" {
  description = "GCP - boot disk type"
  type        = string
  default     = "pd-balanced"
}
