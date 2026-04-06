REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "installing greeter configurations..."
sudo mkdir /usr/share/wallpapers
sudo cp -r $REPO_DIR/images/frierens-staff-3840x2160.jpg /usr/share/wallpapers/frierens-staff-3840x2160.jpg
sudo cp -r $REPO_DIR/etc/sddm.conf /etc/sddm.conf
sudo mkdir /usr/share/sddm/themes/
sudo cp -r $REPO_DIR/sugar-candy/ /usr/share/sddm/themes/
sudo cp -rf $REPO_DIR/ani-cli/ani-cli /usr/bin/ani-cli
sudo chmod +x /usr/bin/ani-cli 
sudo ln -sf $REPO_DIR/nwg-bar/icons /usr/share/nwg-bar/images/icons
echo "Done."
