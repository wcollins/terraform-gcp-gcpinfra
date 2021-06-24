output "vpc_name" {
  description = "Name of VPC being created"
  value       = google_compute_network.vpc.name
}

output "vpc_id" {
  description = "GCP - VPC ID"
  value       = google_compute_network.vpc.id
}

output "network_self_link" {
  description = "URI of the VPC being created"
  value       = google_compute_network.vpc.self_link
}

output "subnet_id" {
  description = "List of subnet IDs"
  value       = google_compute_subnetwork.subnet.*.id
}

output "instance_id" {
  description = "List of instance IDs"
  value       = google_compute_instance.instance.*.instance_id
}

output "private_ip" {
  description = "List of instance private IP addresses"
  value       = google_compute_instance.instance.*.network_interface.0.network_ip
}
