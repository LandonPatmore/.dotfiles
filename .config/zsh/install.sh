#!/bin/bash

# Variables
CONFIG_FILES_DIR="$HOME/.dotfiles/.config"
ZSH_DIR="$CONFIG_FILES_DIR/zsh"
OH_MY_ZSH_DIR="$ZSH_DIR/.oh-my-zsh"
ZSHRC_URL="https://github.com/ohmyzsh/ohmyzsh"

# Function to check the OS type and install Zsh accordingly
install_zsh() {
  echo "Step 2: Installing Zsh..."
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

# Step 1: Create a symbolic link for .zshenv from dotfiles to home directory
echo "Step 1: Creating symbolic link for .zshenv..."
ln -sf $ZSH_DIR/.zshenv ~/.zshenv

# Step 2: Install Zsh
install_zsh

# Step 3: Install Oh My Zsh (unattended, with no shell change)
echo "Step 3: Installing Oh My Zsh (unattended, no shell change)..."
sh -c "$(curl -fsSL $ZSHRC_URL/raw/master/tools/install.sh)" "" --unattended

# Step 4: Remove any .zsh* files from $HOME (excluding .zshenv)
echo "Step 4: Removing .zsh* files from $HOME (excluding .zshenv)..."
find $HOME -maxdepth 1 -name ".zsh*" ! -name ".zshenv" -exec rm -f {} \;

# Step 5: Check for .zshrc and .zshrc.pre-oh-my-zsh in ZSH_DIR (dotfiles)
echo "Step 5: Checking if .zshrc or .zshrc.pre-oh-my-zsh exist in $ZSH_DIR..."
if [ -f "$ZSH_DIR/.zshrc.pre-oh-my-zsh" ]; then
  echo "Found .zshrc.pre-oh-my-zsh inside ZSH_DIR."

  # Only remove .zshrc if .zshrc.pre-oh-my-zsh exists
  if [ -f "$ZSH_DIR/.zshrc" ]; then
    echo "Found .zshrc inside ZSH_DIR. Removing it..."
    rm -f $ZSH_DIR/.zshrc
  fi

  # Rename .zshrc.pre-oh-my-zsh to .zshrc
  echo "Renaming .zshrc.pre-oh-my-zsh to .zshrc..."
  mv $ZSH_DIR/.zshrc.pre-oh-my-zsh $ZSH_DIR/.zshrc
fi

# Step 6: Use rsync to move the .oh-my-zsh directory to the new location
echo "Step 6: Using rsync to move .oh-my-zsh to $OH_MY_ZSH_DIR..."
rsync -av --ignore-existing $HOME/.oh-my-zsh/ $OH_MY_ZSH_DIR/

# Step 7: Change shell to zsh
echo "Step 7: Changing the default shell to zsh..."

check_zsh
set_default_shell

echo "Zsh is now set as your default shell. Please restart your terminal or run 'exec zsh' to switch immediately."

# Final Step: Confirm the setup is complete
echo "Zsh install complete"

