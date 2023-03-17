terraform {
  required_version = ">= 1.4"
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = ">= 2.0"
    }
    google = {
      source = "hashicorp/google"
      version = ">= 4.57"
    }
  }
}

provider "google" {
  project     = var.gcp_project
  region      = var.gcp_region
}
