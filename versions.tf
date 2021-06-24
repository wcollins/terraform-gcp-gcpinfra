terraform {
  required_version = ">= 0.12.29"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "<4.0,>= 2.12"
    }
  }
}
