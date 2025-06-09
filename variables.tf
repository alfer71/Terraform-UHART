variable "vsphere_server" {
  description = "vCenter server"
  type        = string
  default     = "vx-hillyer-vcenter.hartford.edu"
}

variable "vsphere_user" {
  description = "vCenter username"
  type        = string
  sensitive   = true
}

variable "vsphere_password" {
  description = "vCenter password"
  type        = string
  sensitive   = true
}

variable "serverlist" {
  description = "Map of FQDN to VM UUID"
  type        = map(string)
  default = {
    "dw-app-test-02.hartford.edu"  = "421a0929-f6f2-4756-ab84-a07354c80e04"
    "dw-java-test-02.hartford.edu" = "421a11c2-7494-14a3-2fb6-53f0194c5739"
    "uhart-dssba-001.hartford.edu" = "421a4c83-08e4-ce0f-bded-a18e09337273"
    "uhart-dxesa-004.hartford.edu" = "421a8a81-04bb-e2fe-e926-caf739ae240a"
    "uhart-dwkfa-001.hartford.edu" = "421a74c9-0097-7fb6-e0b2-f9d7e00685a8"
    "dw-db-test-02.hartford.edu"   = "421a56c5-77a7-79d0-c2d3-bb0d3ab08422"
    "uhart-dxeaa-004.hartford.edu" = "0d521a42-77af-05f7-1447-63df5badfa4b"
  }
}

# Example: Output the server list
output "server_uuids" {
  value = var.serverlist
}
