# GCP - Base Infrastructure Module
Terraform module that creates base infrastructure in [GCP](https://cloud.google.com/) for testing [Alkira Network Cloud](https://www.alkira.com/). This module is ideal for deploying a flexible network infrastructure with AWS's low-cost, general-purpose [e2-micro](https://cloud.google.com/compute/docs/machine-types#e2_shared-core_machine_types) instances in each subnet for testing. Instances are provisioned without public IP addresses. This presents a simple and completely private environment, ideal for testing integration to Alkira's _Cloud Services Exchange (CSX)_.

## What It Does
- Create a [Virtual Private Cloud (VPC)](https://cloud.google.com/vpc)
- Build one or more [Subnets](https://cloud.google.com/vpc/docs/vpc#manually_created_subnet_ip_ranges) (provided as a list)
- Build an [Instance](https://cloud.google.com/compute/docs/instances) running [Ubuntu](https://ubuntu.com/) per subnet
- Push provided _public key_ data to each instance
- Build and apply [GCP Firewall Rules](https://cloud.google.com/vpc/docs/firewalls) setup with **_any-to-any_** for both **_ingress_** and **_egress_** traffic
> GCP Firewall is set to _allow-all_ for inbound and outbound traffic because Alkira's policy manages this functionality across all clouds; This would normally be a bad practice and not recommended otherwise

## Usage
```hcl
provider "google" {
  credentials = "${file("credentials.json")}"
  region      = "us-east4"
  zone        = "us-east4-a"
}

module "infra" {
  source  = "wcollins/gcpinfra/gcp"

  vpc_name         = "vpc-gcp-east"
  subnet_names     = ["subnet-01", "subnet-02", "subnet-03"]
  subnet_prefixes  = ["10.3.1.0/24", "10.3.2.0/24", "10.3.3.0/24"]
  instance_names   = ["vm-gcp-east-01", "vm-gcp-east-02", "vm-gcp-east-03"]
  project_id       = var.project_id
  ssh_key          = var.ssh_key
}
```
