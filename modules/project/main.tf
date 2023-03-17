resource "digitalocean_project" "project" {
  name        = var.project_name
  description = "A project to work on Istio Multi-Cluster Networking"
  purpose     = "Istio MCN Environment"
  environment = "Development"
  resources   = var.project_resources
}
