terraform {
  source = "../modules/firewall//"
}

include "root" {
  path = find_in_parent_folders()
}
