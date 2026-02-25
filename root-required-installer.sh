REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "installing greeter configurations..."
sudo mkdir /usr/share/wallpaper
sudo cp -r $REPO_DIR/images/frieren-staff-3840x2160.jpg /usr/share/wallpaper/frieren-staff-3840x2160.jpg
sudo cp -r $REPO_DIR/etc/sddm.conf /etc/sddm.conf
sudo mkdir /usr/share/sddm/themes/
sudo cp -r $REPO_DIR/sugar-candy/ /usr/share/sddm/themes/
sudo cp $REPO_DIR/ani-cli/ani-cli /usr/bin/ani-cli
sudo chmod +x /usr/bin/ani-cli 
echo "Done."