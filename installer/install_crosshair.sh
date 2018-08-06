#!/bin/bash
# Crosshair installer

# Installs Crosshair on a minimal Debian 9 system.


section_header(){
    printf "\n\n##\n##  $1\n##\n\n\n"
}

terminate_if_nonzero_exit(){
    if [ $? -ne 0 ] ; then
        printf "\nERROR: $1\n\n"
        exit $?
    fi
}


# Prepare the screen.
clear
echo


# Check that this script is not being run as root.
if [ "$EUID" -eq 0 ] ; then
    printf "ERROR: You must NOT run this script as the root user.\n\n"
    printf "Try running it like this instead:\n"
    printf "$ ./update_crosshair.sh\n\n\n"
    exit 1
fi


# Write the welcome message.
printf "##\n## Welcome to the Crosshair installer.\n##\n"


# Get wifi credentials.
section_header "Internet connection."
printf "Let's start by getting connected to your wifi.\n\n"
read -p "Wifi network name: " WIFI_NAME
read -p "Wifi network password: " WIFI_PASSWORD


# Connect to the wifi.
section_header "Establishing a wifi connection."

WIFI_DEVICE=$(
    ip a | awk 'match ($2, /^w/) { print substr ($2, 1, length($2)-1) }'
)

if [ -z $WIFI_DEVICE ] ; then
    printf "ERROR: Wifi device could not be identified.\n\n"
    exit $?
fi

printf "Wifi device has been identified as: $WIFI_DEVICE\n\n\n"

sudo ip link set $WIFI_DEVICE up
terminate_if_nonzero_exit "Wifi device could not be activated."

wpa_passphrase $WIFI_NAME $WIFI_PASSWORD | \
    sudo wpa_supplicant -i $WIFI_DEVICE -c /dev/stdin -B
terminate_if_nonzero_exit "Could not connect to wifi."

sudo dhclient $WIFI_DEVICE
terminate_if_nonzero_exit "Connected to wifi, but could not attach to network."

printf "\nConnected to wifi.\n"


# Install Ansible.
section_header "Installing Ansible"

sudo apt update
sudo apt -y install python-pip
pip install ansible==2.6.2


# Install Crosshair.
section_header "Running Crosshair installer playbook."

cd ../playbook
# Temporarily add the location of packages installed by pip to $PATH or
# ansible-playbook won't be found.
PATH+=":$HOME/.local/bin"
ansible-playbook --ask-become-pass -i hosts crosshair.yml
terminate_if_nonzero_exit "The Ansible playbook didn't complete."


# Finish up.
printf "\nInstallation complete.\n\n"
read -n 1 -s -p "Press any key to reboot and start using Crosshair."
sudo systemctl reboot
