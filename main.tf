terraform {
  required_providers {
    vsphere = {
      source  = "vmware/vsphere"
      version = "~> 2.12.0"
    }
  }
}
# Configure the vSphere provider
provider "vsphere" {
  user           = var.vsphere_user
  password       = var.vsphere_password
  vsphere_server = var.vsphere_server
  allow_unverified_ssl = true
  api_timeout = 30
}

data "vsphere_datacenter" "datacenter"{
    name = "VxRail-Datacenter"
}

resource "vsphere_virtual_machine_snapshot" "bf_path" {
    for_each = var.serverlist
    virtual_machine_uuid = "${each.value}"
    snapshot_name        = "Patching_DATE"
    description          = "CSTASK####-Perform Snapshots before patching"
    memory               = "true"
    quiesce              = "true"
    remove_children      = "false"
    consolidate          = "true"
}

# data "vsphere_datastore" "datastore"{
#   name = "newasa"
#   datacenter_id = "${data.vsphere_datacenter.EITSVC02.id}"
# }
