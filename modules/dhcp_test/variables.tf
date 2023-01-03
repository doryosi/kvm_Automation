variable "hosts" {
  type = number
  default = 1
}
variable "memory" {
  type = string
  default = "2048"
}
variable "vcpu" {
  type = number
  default = 2
}
variable "qcow2" {
  type = string
  default = "centos"
}
variable "hostname" {
  type = list(string)
  default = [
    "centos1",
    "centos2",
    "centos3",
    "centos4",
    "centos5",
    "centos6",
    "centos7",
    "centos8",
    "centos9",
    "centos10",
    ]
}
variable "interface" {
  type = string
  default = "br372"
}

variable "network_type" {
  type = string
  default = "bridge"
}

variable "ssh_path" {
  type = string
  default = "/home/smb/KVM_Automation"
}

# variable "ips" {
#   type = list(string)
#   default = [
#     "10.36.0.31",
#     "10.36.0.32",
#     "10.36.0.33",
#     "10.36.0.34",
#     "10.36.0.35",
#     "10.36.0.36",
#     "10.36.0.37",
#     "10.36.0.38",
#     "10.36.0.39",
#     "10.36.0.40",
#     ]
# }
# variable "macs" {
#   type = list(string)
#   default = [
#     "52:54:00:50:99:c1", 
#     "52:54:00:0e:87:c2", 
#     "52:54:00:9d:90:c3",
#     "52:54:00:0e:87:c4",
#     "52:54:00:0e:87:c5",
#     "52:54:00:0e:87:c6",
#     "52:54:00:0e:87:c7",
#     "52:54:00:0e:87:c8",
#     "52:54:00:0e:87:c9",
#     "52:54:00:0e:87:c0",
#     ]
# }
