dependency "tor1_doks" {
  config_path = "../tor1"
  mock_outputs = {
    k8s_resource = "tor1-sample-k8s-urn"
  }
}

dependency "nyc3_doks" {
  config_path = "../nyc3"
  mock_outputs = {
    k8s_resource = "nyc3-sample-k8s-urn"
  }
}

inputs = {
  project_name = "istio-mcn-doks"
  project_resources = [
    dependency.tor1_doks.outputs.k8s_resource,
    dependency.nyc3_doks.outputs.k8s_resource,
  ]
}

terraform {
  source = "../modules/project//"
}

include "root" {
  path = find_in_parent_folders()
}
