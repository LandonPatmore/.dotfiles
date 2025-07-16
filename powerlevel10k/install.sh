#!/bin/bash

# Variables
CONFIG_FILES_DIR="$HOME/.dotfiles/.config"
OH_MY_ZSH_DIR="$CONFIG_FILES_DIR/zsh/.oh-my-zsh"
POWERLEVEL10K_URL="https://github.com/romkatv/powerlevel10k.git"
POWERLEVEL10K_DIR="$OH_MY_ZSH_DIR/custom/themes/powerlevel10k"

# Step 1: Clone Powerlevel10K into the custom themes directory of Oh My Zsh, but only if it's not already cloned
echo "Step 1: Checking if Powerlevel10K is already cloned..."
if [ ! -d "$POWERLEVEL10K_DIR" ]; then
  echo "Cloning Powerlevel10K repository..."
  git clone $POWERLEVEL10K_URL $POWERLEVEL10K_DIR
else
  echo "Powerlevel10K is already installed at $POWERLEVEL10K_DIR. Skipping clone."
fi

# Final confirmation
echo "Powerlevel10K installation complete"
