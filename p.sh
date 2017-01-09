#!/bin/bash
echo "Start publishing wp-banking-services product"
apic login --username student@think.ibm --password Passw0rd! --server 192.168.225.100
apic publish banking-services_1.0.0.yaml --catalog sb --organization sales --server 192.168.225.100
