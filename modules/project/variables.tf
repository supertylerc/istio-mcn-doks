variable "project_name" {
  description = "DigitalOcean project name"
  type        = string
  default     = "istio-mcn-doks"
}

variable "project_resources" {
  description = "DigitalOcean project resources"
  type        = list(string)
}
