#!/bin/bash

# Loop n numbers of times
for i in {1..$1};do

    # Turn off all KVM virtual machines
    virsh list --all | grep running | awk '{print $2}' | xargs -n 1 virsh shutdown

    # Wait for 2 minutes
    sleep 120

    #Flush dhcpd service from the GW
    sshpass -p zubur1 ssh -o StrictHostKeyChecking=no  admin@10.39.9.100 'killall dhcp ; rm /flash/dhcpd.leases.*'

    # Turn on all KVM virtual machines
    virsh list --all | grep shut | awk '{print $2}' | xargs -n 1 virsh start

    # Wait for 2 minutes
    sleep 120

done
