#!/bin/bash

# PolLand Installer
# curl -fsSL https://raw.githubusercontent.com/Pol-Jak-295/PolLand/main/install.sh | sh
set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo "${GREEN}=== PolLand Hyprland Rice Installer ===${NC}"

DOTFILES_DIR="$HOME/PolLand"

# Clone/pull repo
if [ -d "$DOTFILES_DIR" ]; then
    echo "${YELLOW}Updating existing PolLand installation...${NC}"
    git -C "$DOTFILES_DIR" pull
else
    echo "${YELLOW}Cloning PolLand repository...${NC}"
    git clone https://github.com/Pol-Jak-295/PolLand.git "$DOTFILES_DIR"
fi

# Make main installer executable and run it
cd "$DOTFILES_DIR"
chmod +x install.sh
./install.sh  # This calls install2.sh internally

echo "${GREEN}Installation complete! Your dotfiles are at $DOTFILES_DIR${NC}"
echo "${GREEN}Log out and select Hyprland to start.${NC}"