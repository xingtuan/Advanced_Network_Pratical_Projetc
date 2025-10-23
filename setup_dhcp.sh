#!/bin/bash

sudo apt install isc-dhcp-server -y

sudo bash -c 'cat > /etc/dhcp/dhcpd.conf <<EOF
authoritative;
option domain-name "victor.xzy";
option domain-name-servers 8.8.8.8, 1.1.1.1;

subnet 172.16.1.0 netmask 255.255.255.0 {
  range 172.16.1.100 172.16.1.200;
  option routers 172.16.1.1;
}
EOF'

sudo systemctl restart isc-dhcp-server
sudo systemctl enable isc-dhcp-server

sudo systemctl status isc-dhcp-server
