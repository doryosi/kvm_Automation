#libvirtd provider to provision KVM/QEMU VMs
terraform {
  required_providers {
    libvirt = {
      source = "dmacvicar/libvirt"
    }
  }
}

provider "libvirt" {
  ## Configuration options
  uri = "qemu:///system"
  #alias = "server2"
  #uri   = "qemu+ssh://root@127.0.0.1/system"
}

module "DHCP_Test" {
  source = "./modules/dhcp_test"
}