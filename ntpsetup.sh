#!/bin/bash

# Install systemd-timesyncd
echo "Installing systemd-timesyncd..."
sudo apt update
sudo apt install -y systemd-timesyncd

# Edit the timesyncd.conf file to add the NTP server
NTP_CONF="/etc/systemd/timesyncd.conf"
NTP_SERVER="" # Add NTP server here before running

echo "Configuring NTP server..."
sudo sed -i "s|#NTP=|NTP=$NTP_SERVER|g" $NTP_CONF

# Enable NTP synchronization
echo "Enabling NTP synchronization..."
sudo timedatectl set-ntp true

# Restart systemd-timesyncd to apply changes
echo "Restarting systemd-timesyncd..."
sudo systemctl restart systemd-timesyncd

# Check status of time synchronization
echo "Checking time synchronization status..."
timedatectl status

# Display recent logs for systemd-timesyncd
echo "Showing recent logs for systemd-timesyncd..."
sudo journalctl -u systemd-timesyncd --since "5 minutes ago"

echo "NTP synchronization setup completed."
