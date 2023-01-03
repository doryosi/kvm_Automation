#cloud-config
# vim: syntax=yaml
hostname: ${host_name}
manage_etc_hosts: true
package_upgrade: true
users:
  - name: smb
    gecos: Admin User
    groups: users,admin,wheel
    sudo: ALL=(ALL) NOPASSWD:ALL
    ssh_authorized_keys:
      - ${auth_key}
  - name: ansible
    gecos: Ansible User
    groups: users,admin,wheel
    sudo: ALL=(ALL) NOPASSWD:ALL
    shell: /bin/bash
    lock_passwd: true
    ssh_authorized_keys:
      - ${auth_key}
ssh_pwauth: true
disable_root: false
chpasswd:
  list: |
    smb:zubur1
    ansible:zubur1:
  expire: false
growpart:
  mode: auto
  devices: [/]

