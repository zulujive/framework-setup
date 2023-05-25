#!/bin/bash

# THIS SCRIPT MUST BE RUN AS ROOT (use sudo su)
# Use this to configure your Framework Laptop for Debian Sid

# What the script does:
# - Installs git, cURL, OpenJDK, and ZSH
# - Installs various drivers and plugins
# - Allows for the addition of stable Debian Buster packages
# - Applies various settings to optimize performance and usability

# Check if the script is being run with root privileges
if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root (use 'sudo su')."
  exit 1
fi

# Install Necessary Packages
# Install Necessary Packages
apt update >/dev/null 2>&1
apt install fprintd libpam-fprintd powertop intel-media-va-driver intel-gpu-tools git curl default-jdk zsh -y >/dev/null 2>&1

# Ask about installing Debian Buster repos as a failover in case a package is not found in Sid repos
bash -c '
read -rp "Do you want to add stable Debian repositories as a failover (sometimes required for installing certain software)? (Y/n) " choice
choice=${choice:-n}
choice=${choice,,}
while [[ ! "${choice}" =~ ^(y|n)$ ]]; do
    read -p "Please enter Y for Yes or N for No: " choice
    choice=${choice,,}
done

if [[ "${choice}" == "y" ]]; then
    echo "Using stable repos as failover"
    cp /etc/apt/sources.list /etc/apt/sources.list.bak
    echo "deb http://deb.debian.org/debian buster main" >> /etc/apt/sources.list
    echo "deb http://deb.debian.org/debian buster-updates main" >> /etc/apt/sources.list
    echo "deb http://security.debian.org/debian-security buster/updates main" >> /etc/apt/sources.list
    apt update
else
    echo "Using unstable repos only"
fi
'

# Apply Settings
echo 'GRUB_CMDLINE_LINUX_DEFAULT="quiet splash module_blacklist=hid_sensor_hub"' >> /etc/default/grub >/dev/null 2>&1
update-grub >/dev/null 2>&1
gsettings set org.gnome.mutter experimental-features "['scale-monitor-framebuffer']" >/dev/null 2>&1
powertop --auto-tune >/dev/null 2>&1
systemctl start powertop >/dev/null 2>&1
systemctl enable powertop >/dev/null 2>&1
echo PCIE_ASPM_ON_BAT=powersupersave >> /etc/tlp.conf >/dev/null 2>&1
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended >/dev/null 2>&1
echo "Successfully installed packages and updated settings. Please restart your system for some settings to take effect."
