#!/bin/bash
#
# Made by Pol-Jak-295
#
# install script for PolLand rice

config_dirs=( "hypr" "waybar" "rofi" "kitty" "nvim" "gtk-3.0" "gtk-4.0" "ani-cli" "images" )
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SUFFIX=$(date +%s)
CNT="\e[1;36m"
CWR="\e[1;33m"
OFF="\e[0m"

echo -e "${CNT}PolLand Installation Script${OFF}"
echo -e "Repo location: $REPO_DIR"
echo ""
echo -n "Install method: [S]ymlink (recommended) or [C]opy? [S/c] "
read -r method

SYMLINK=true
if [[ "$method" =~ ^[Cc]$ ]]; then
    SYMLINK=false
fi

echo -n "Would you like to back up existing configs? [Y/n] "
read -r response 

if [[ -z "$response" || "$response" =~ ^[Yy]$ ]]; then
    echo -e "${CNT}Backing up existing configs...${OFF}"
    
    for dir in "${config_dirs[@]}"; do
        if [ -e "$HOME/.config/$dir" ]; then
            mv "$HOME/.config/$dir" "$HOME/.config/$dir.$SUFFIX.old"
            echo -e "  ${CWR}[backup]${OFF} $dir/ -> $dir.$SUFFIX.old/"
        fi
    done
fi

# Install configs
if [ "$SYMLINK" = true ]; then
    echo -e "${CNT}Symlinking PolLand configs...${OFF}"
    for dir in "${config_dirs[@]}"; do
        if [ -d "$REPO_DIR/$dir" ]; then
            mkdir -p "$HOME/.config"
            ln -sf "$REPO_DIR/$dir" "$HOME/.config/$dir"
            echo -e "  ${CNT}[symlink]${OFF} $dir/ -> $REPO_DIR/$dir"
        else
            echo -e "  ${CWR}[skip]${OFF} $dir/ (not found in repo)"
        fi
    done
else
    echo -e "${CNT}Copying PolLand configs...${OFF}"
    for dir in "${config_dirs[@]}"; do
        if [ -d "$REPO_DIR/$dir" ]; then
            mkdir -p "$HOME/.config"
            cp -r "$REPO_DIR/$dir" "$HOME/.config/"
            echo -e "  ${CNT}[install]${OFF} $dir/"
        else
            echo -e "  ${CWR}[skip]${OFF} $dir/ (not found in repo)"
        fi
    done
fi

# Handle images/wallpapers
if [ -d "$REPO_DIR/images" ]; then
    echo -e "${CNT}Setting up wallpapers...${OFF}"
    mkdir -p "$HOME/.config/PolLand"
    if [ "$SYMLINK" = true ]; then
        ln -sf "$REPO_DIR/images" "$HOME/.config/PolLand/images"
    else
        cp -r "$REPO_DIR/images" "$HOME/.config/PolLand/"
    fi
fi

echo ""
echo -e "${CNT}Installation complete!${OFF}"
if [ "$SYMLINK" = true ]; then
    echo "Configs are symlinked. Run 'git pull' in $REPO_DIR to update."
fi
echo "You may need to reload Hyprland (Super+Shift+R) or restart your session."