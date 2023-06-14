#!/bin/bash

# Define color codes for formatting
GREEN="\e[32m"
CYAN="\e[36m"
YELLOW='\033[33m'
RESET="\e[0m"

# Define progress bar function
progressbar() {
  local duration=${1}
  local bar_length=40
  local sleep_duration=$(echo "scale=5; ${duration} / ${bar_length}" | bc)

  for ((i = 0; i <= bar_length; i++)); do
    echo -ne "\e[34m[\e[0m"
    for ((j = 0; j <= i; j++)); do
      echo -ne "\e[34m=\e[0m"
    done
    echo -ne "\e[34m>\e[0m"
    for ((j = i; j < bar_length; j++)); do
      echo -ne "\e[34m \e[0m"
    done
    echo -ne "\e[34m]\e[0m"
    echo -ne " ($(echo "scale=2; $i * (100 / $bar_length)" | bc)%)\r"
    sleep "${sleep_duration}"
  done
  echo ""
}

# THIS SCRIPT MUST BE RUN AS ROOT (use sudo su)
# Use this to configure your Framework Laptop for Debian Sid

# What the script does:
# - Installs git, cURL, OpenJDK, and ZSH
# - Installs various drivers and plugins
# - Allows for the addition of stable Debian Buster packages
# - Applies various settings to optimize performance and usability

# Check if the script is being run with root privileges
if [[ $EUID -ne 0 ]]; then
  echo -e "${CYAN}This script must be run as root (use 'sudo su').${RESET}"
  exit 1
fi

echo -e "${GREEN}Installing Packages...${RESET}"
echo -e "${YELLOW}Updating Repositories...${RESET}"
apt update >/dev/null 2>&1 | progressbar 15
echo -e "${YELLOW}Installing...${RESET}"
apt install fprintd libpam-fprintd powertop intel-media-va-driver intel-gpu-tools git curl default-jdk zsh -y >/dev/null 2>&1 | progressbar 5
echo -e "${YELLOW}Setting up ZSH...${RESET}"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended >/dev/null 2>&1 | progressbar 5
echo -e "${GREEN}Packages Installed!${RESET}"
echo ""

# Ask about installing Debian Buster repos as a failover in case a package is not found in Sid repos
echo -e "${YELLOW}Applying repository changes...${RESET}"
apt update >/dev/null 2>&1 | progressbar 15
echo -e "${YELLOW}Uprading Packages...${YELLOW}"
apt upgrade -y 2>&1 | progressbar 5
echo -e "${GREEN}Packages Upgraded!${RESET}"
echo ""

# Apply Settings
echo -e "${CYAN}Installing GRUB Blacklist${RESET}"
echo 'GRUB_CMDLINE_LINUX_DEFAULT="quiet splash module_blacklist=hid_sensor_hub"' >> /etc/default/grub >/dev/null 2>&1
update-grub >/dev/null 2>&1 | progressbar 5
gsettings set org.gnome.mutter experimental-features "['scale-monitor-framebuffer']" >/dev/null 2>&1
echo ""
echo -e "${CYAN}Configuring PowerTOP...${RESET}"
powertop --auto-tune >/dev/null 2>&1
systemctl start powertop >/dev/null 2>&1 | progressbar 3
systemctl enable powertop >/dev/null 2>&1
echo "PCIE_ASPM_ON_BAT=powersupersave" >> /etc/tlp.conf >/dev/null 2>&1
echo -e "${GREEN}PowerTOP Configured!${RESET}"
echo ""
echo -e "${GREEN}Successfully installed packages and updated settings. Please restart your system for some settings to take effect.${RESET}"
