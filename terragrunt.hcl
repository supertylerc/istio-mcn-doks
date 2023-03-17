generate "backend" {
  path      = "backend.tf"
  if_exists = "skip"
  contents = <<EOF
terraform {
  backend "gcs" {
    bucket      = "istio-mcn-doks"
    prefix      = "${path_relative_to_include()}/istio-mcn-doks"
  }
}
EOF
}
