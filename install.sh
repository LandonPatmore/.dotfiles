#!/bin/bash

# Variables
CONFIG_FILES_DIR="$HOME/.dotfiles/.config"

# Go through each folder in CONFIG_FILES_DIR and run any install.sh found
echo -e "\033[1;34m===========================\033[0m"
echo -e "\033[1;34mRunning install.sh scripts...\033[0m"
echo -e "\033[1;34m===========================\033[0m"

for dir in "$CONFIG_FILES_DIR"/*/; do
  if [ -f "$dir/install.sh" ]; then
    echo -e "\033[1;33m=================================\033[0m"
    echo -e "\033[1;33mRunning install.sh in directory: $dir\033[0m"
    echo -e "\033[1;33m=================================\033[0m"
    
    # Run the install.sh script found in the directory
    bash "$dir/install.sh" || echo -e "\033[1;31mFailed to run install.sh in $dir\033[0m"
    
    # Add a visual separator between each script execution
    echo -e "\033[1;34m------------------------------------------------------\033[0m"
  fi
done

# Final confirmation
echo -e "\033[1;32m===============================\033[0m"
echo -e "\033[1;32mAll install.sh scripts executed!\033[0m"
echo -e "\033[1;32m===============================\033[0m"

