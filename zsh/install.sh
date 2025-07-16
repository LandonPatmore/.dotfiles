#!/bin/bash

# Variables
DOT_FILES="$HOME/.dotfiles"
ZSH_DIR="$DOT_FILES/zsh"
OH_MY_ZSH_DIR="$ZSH_DIR/.oh-my-zsh"

unset ZSH

# Function to check the OS type and install Zsh accordingly
install_zsh() {
  if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # For Linux, use apt
    sudo apt update && sudo apt install -y zsh
  elif [[ "$OSTYPE" == "darwin"* ]]; then
    # For macOS, use brew
    if command -v brew &>/dev/null; then
      brew install zsh
    else
      echo "Homebrew is not installed. Please install Homebrew first."
      exit 1
    fi
  else
    echo "Unsupported OS. This script only supports Linux and macOS."
    exit 1
  fi
}

# Function to check if zsh is installed
check_zsh() {
    if command -v zsh &> /dev/null; then
        echo "Zsh is already installed."
    else
        echo "Zsh not found. Installing..."
        if [[ "$OSTYPE" == "darwin"* ]]; then
            brew install zsh
        elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
            sudo apt update
            sudo apt install -y zsh
        fi
    fi
}

# Function to set zsh as default shell
set_default_shell() {
    local zsh_path
    zsh_path=$(which zsh)

    # macOS and Linux may have different paths for zsh
    if [[ "$OSTYPE" == "darwin"* ]]; then
        sudo chsh -s "$zsh_path" "$(whoami)"
    elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
        # Linux might have different shell paths, check if zsh is in /usr/bin or /bin
        if [[ -x "$zsh_path" ]]; then
            sudo chsh -s "$zsh_path" "$(whoami)"
        else
            echo "Zsh path not found, cannot set as default."
        fi
    fi
}

echo "Removing existing oh-my-zsh data..."
rm -rf $OH_MY_ZSH_DIR

echo "Removing any zsh files from $HOME"
rm $HOME/.zshrc
rm $HOME/.zprofile
rm $HOME/.zshenv

echo "Installing Zsh..."
install_zsh

echo "Installing Oh My Zsh (unattended, no shell change)..."
sh -c "$(curl -fsSL https://github.com/ohmyzsh/ohmyzsh/raw/master/tools/install.sh)" "" --unattended

echo "Using rsync to move .oh-my-zsh to $OH_MY_ZSH_DIR..."
mv $HOME/.oh-my-zsh/ $OH_MY_ZSH_DIR/

echo "Creating symbolic link for zsh files..."
ln -sf $ZSH_DIR/.zshenv ~/.zshenv
ln -sf $ZSH_DIR/.zprofile ~/.zprofile
ln -sf $ZSH_DIR/.zshrc ~/.zshrc

echo "Changing the default shell to zsh..."

check_zsh
set_default_shell

echo "Zsh is now set as your default shell. Please restart your terminal or run 'exec zsh' to switch immediately."

echo "Zsh install complete"

