ethernets:
    ${interface}:
        dhcp4: true
        gateway4: 10.37.2.1
        nameservers:
            addresses: 
            - 1.1.1.1
            - 8.8.8.8
        set-name: ${interface}
version: 2
