#!/bin/bash

# Function to prompt and install
prompt_install() {
    local app_name="$1"
    local install_cmd="$2"

    read -p "Do you want to install $app_name? (y/n): " choice
    if [[ "$choice" =~ ^[Yy]$ ]]; then
        echo "Installing $app_name..."
        eval "$install_cmd"
        echo "$app_name installed successfully."
    else
        echo "Skipped $app_name."
    fi
    echo
}

# Check yay availability
if ! command -v yay &> /dev/null; then
    echo "Error: 'yay' is not installed. Please install it first."
    exit 1
fi

# Prompt and install each software
prompt_install "KDE Connect" "yay -S --noconfirm kdeconnect"
prompt_install "Visual Studio Code" "yay -S --noconfirm visual-studio-code-bin"
prompt_install "Opera Browser" "yay -S --noconfirm opera"
prompt_install "Brave Browser" "yay -S --noconfirm brave-bin"
prompt_install "VirtualBox" "yay -S --noconfirm virtualbox virtualbox-host-modules-arch"

echo "Done."
