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
resource "libvirt_volume" "distro-qcow2" {
  count  = var.hosts
  name   = "${var.hostname[count.index]}.qcow2"
  pool   = "distro-pool"
  source = "${var.ssh_path}/sources/${var.qcow2}.qcow2"
  #source = "https://cloud.centos.org/centos/8/x86_64/images/CentOS-8-GenericCloud-8.2.2004-20200611.2.x86_64.qcow2"
  format = "qcow2"
}
resource "libvirt_cloudinit_disk" "commoninit" { 
  count     = var.hosts
  name      = "commoninit-${var.hostname[count.index]}.iso"
  pool      = "distro-pool"  
  user_data = templatefile("${path.module}/templates/user_data.tpl", {
      host_name = var.hostname[count.index]
      auth_key  = file("${var.ssh_path}/ssh/id_rsa.pub")
  })
  network_config =   templatefile("${path.module}/templates/network_config.tpl", {
     interface = var.interface
    #  mac_addr = var.macs[count.index]
  })
}
resource "libvirt_network" "smb_network" {
  name = var.interface
  mode = var.network_type
  bridge = var.interface
  autostart = true
}
resource "libvirt_domain" "domain-distro" {
  count  = var.hosts
  name   = var.hostname[count.index]
  memory = var.memory
  vcpu   = var.vcpu
  cloudinit = element(libvirt_cloudinit_disk.commoninit.*.id, count.index)
  
  network_interface {
      network_name = var.interface
      # addresses    = [var.ips[count.index]]
      # mac          = var.macs[count.index]
  }
  console {
      type        = "pty"
      target_port = "0"
      target_type = "serial"
  }
  console {
      type        = "pty"
      target_port = "1"
      target_type = "virtio"
  }
  disk {
      volume_id = element(libvirt_volume.distro-qcow2.*.id, count.index)
  }
}
