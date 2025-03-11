#!/bin/bash

# Variables
CONFIG_FILES_DIR="$HOME/.dotfiles/.config"
OH_MY_ZSH_DIR="$CONFIG_FILES_DIR/zsh/.oh-my-zsh"
POWERLEVEL10K_URL="https://github.com/romkatv/powerlevel10k.git"

# Step 1: Clone Powerlevel10K into the custom themes directory of Oh My Zsh
echo "Step 1: Cloning Powerlevel10K repository..."
git clone $POWERLEVEL10K_URL $OH_MY_ZSH_DIR/custom/themes/powerlevel10k

# Final confirmation
echo "powerlevel10k install complete"
