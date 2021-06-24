resource "google_compute_network" "vpc" {
  name                    = var.vpc_name
  project                 = var.project_id
  description             = var.description
  routing_mode            = var.routing_mode
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet" {
  count                    = length(var.subnet_names)
  project                  = var.project_id
  name                     = var.subnet_names[count.index]
  ip_cidr_range            = var.subnet_prefixes[count.index]
  network                  = google_compute_network.vpc.id
  private_ip_google_access = true
}

resource "google_compute_instance" "instance" {
  count        = length(var.instance_names)
  name         = var.instance_names[count.index]
  project      = var.project_id
  machine_type = var.machine_type
  tags         = ["all"]

  metadata = {
    sshKeys = "${var.ssh_user}:${var.ssh_key}"
  }

  boot_disk {
    initialize_params {
      image = var.boot_disk_image
      type  = var.boot_disk_type
    }
  }

  metadata_startup_script = "sudo apt-get update && sudo apt-get -y upgrade && sudo apt-get -y dist-upgrade"

  network_interface {
    network    = google_compute_network.vpc.self_link
    subnetwork = google_compute_subnetwork.subnet.*.self_link[count.index]
  }
}

resource "google_compute_firewall" "allow-all" {
  name = "allow-all"
  project = var.project_id
  network = google_compute_network.vpc.name

  allow {
    protocol = "all"
  }

  target_tags   = ["all"]
  source_ranges = ["0.0.0.0/0"]
}
