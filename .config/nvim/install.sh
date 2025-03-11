#!/bin/bash

# Function to install Neovim on Linux
install_neovim_linux() {
    echo "Installing Neovim on Linux..."
    # Check if the system is using apt (Debian/Ubuntu-based distros)
    if command -v apt-get &> /dev/null; then
        sudo apt-get update
        sudo apt-get install -y neovim
    # Check if the system is using yum (CentOS/RHEL/Fedora)
    elif command -v yum &> /dev/null; then
        sudo yum install -y neovim
    # Check if the system is using dnf (Fedora)
    elif command -v dnf &> /dev/null; then
        sudo dnf install -y neovim
    # Check if the system is using pacman (Arch-based distros)
    elif command -v pacman &> /dev/null; then
        sudo pacman -Syu neovim
    else
        echo "Unsupported Linux distribution"
        exit 1
    fi
}

# Function to install Neovim on macOS
install_neovim_macos() {
    echo "Installing Neovim on macOS..."
    # Check if Homebrew is installed
    if command -v brew &> /dev/null; then
        brew install neovim
    else
        echo "Homebrew is not installed. Please install Homebrew first."
        exit 1
    fi
}

# Main logic to detect OS and call the corresponding function
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Linux
    install_neovim_linux
elif [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS
    install_neovim_macos
else
    echo "Unsupported OS. This script supports only Linux and macOS."
    exit 1
fi

echo "Neovim installation complete!"

