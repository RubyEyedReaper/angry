#!/bin/bash
set -e

# — System update & cleanup —

apt update && apt full-upgrade -y && apt autoremove -y && apt autoclean -y

# — Install and enable SSH —

apt install openssh-server curl -y
systemctl enable ssh
systemctl start ssh

# — Configure firewall for SSH —

ufw allow ssh
yes | ufw enable

# — Set static IP —

conn=$(nmcli -t -f NAME,DEVICE connection show –active | head -n1 | cut -d: -f1)
iface=$(nmcli -t -f NAME,DEVICE connection show –active | head -n1 | cut -d: -f2)
ip_with_prefix=$(ip -4 addr show “$iface” | grep -oP ‘(?<=inet\s)\d+(.\d+){3}/\d+’ | head -n1)
gw=$(ip route | grep default | grep “$iface” | awk ‘{print $3}’)
nmcli connection modify “$conn” ipv4.addresses “$ip_with_prefix” ipv4.gateway “$gw” ipv4.dns “1.1.1.1,8.8.8.8” ipv4.method manual
nmcli connection up “$conn”

# — Reboot —

reboot
