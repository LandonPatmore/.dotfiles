#!/bin/bash

# Variables
CONFIG_FILES_DIR="$HOME/.dotfiles/.config"
ZSH_DIR="$CONFIG_FILES_DIR/zsh"
OH_MY_ZSH_DIR="$ZSH_DIR/.oh-my-zsh"
ZSHRC_URL="https://github.com/ohmyzsh/ohmyzsh"

# Function to check the OS type and install Zsh accordingly
install_zsh() {
  echo "Installing Zsh..."
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

# Step 1: Install Zsh
install_zsh

# Step 2: Install Oh My Zsh (unattended, with no shell change)
echo "Step 2: Installing Oh My Zsh (unattended, no shell change)..."
sh -c "$(curl -fsSL $ZSHRC_URL/raw/master/tools/install.sh)" "" --unattended

# Step 3: Remove any .zsh* files from $HOME (excluding .zshenv)
echo "Step 3: Removing .zsh* files from $HOME (excluding .zshenv)..."
rm -f ~/.zshrc
rm -f ~/.zshrc.pre-oh-my-zsh
find $HOME -maxdepth 1 -name ".zsh*" ! -name ".zshenv" -exec rm -f {} \;

# Step 4: Check for .zshrc and .zshrc.pre-oh-my-zsh in ZSH_DIR (dotfiles)
echo "Step 4: Checking if .zshrc or .zshrc.pre-oh-my-zsh exist in $ZSH_DIR..."
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

# Step 5: Move the newly created .oh-my-zsh directory to the new location
echo "Step 5: Moving .oh-my-zsh to $OH_MY_ZSH_DIR..."
mv $HOME/.oh-my-zsh $OH_MY_ZSH_DIR

# Step 6: Create a symbolic link for .zshenv from dotfiles to home directory
echo "Step 7: Creating symbolic link for .zshenv..."
ln -s $ZSH_DIR/.zshenv ~/.zshenv

# Final Step: Confirm the setup is complete
echo "zsh install complete"
