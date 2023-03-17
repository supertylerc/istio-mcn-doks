locals {
  region = "nyc3"
  project_name = "${local.region}-istio-mcn-docks"
}

inputs = {
  vpc_ip_range = "10.20.40.0/24"
  region       = local.region
  project_name = local.project_name
  cluster_name = "${local.region}-${local.project_name}"
  
}

terraform {
  source = "../modules/doks//"

  before_hook "create_default_vpc" {
    commands     = ["apply"]
    execute = [
      "/bin/bash",
      "${get_parent_terragrunt_dir()}/create_dummy_vpc.sh",
      local.region,
      "192.168.2.0/24"
    ]
  }
}

include "root" {
  path = find_in_parent_folders()
}
