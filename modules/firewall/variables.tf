variable "node_tags" {
  description = "The list of instance tags applied to all nodes."
  type        = list(string)
  default     = ["kubernetes"]
}
