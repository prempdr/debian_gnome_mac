#!/bin/bash

user_name="$USER"

echo " "
echo "cloning theme..."
echo " "

git clone https://github.com/prempdr/gnome_mac_theme.git theme --depth=1

echo " "
echo "cloning icon..."
echo " "

git clone https://github.com/prempdr/gnome_wi11_icon.git icon --depth=1
cd icon
./install.sh

echo " "
echo "coping cursors..."
echo " "

cd ..
cd cursor
sudo cp -r mac_dark ~/.local/share/icons/
sudo cp -r mac_light ~/.local/share/icons/

cd ..
mv theme.sh theme
cd theme
./theme.sh

echo " "
echo "installing icon..."
echo " "

cd ..
cd icon
./install.sh -b

echo " "
echo "installing wallpaper..."
echo " "

cd ..
mkdir -p ~/Documents/
cp -r wallpaper/* ~/Documents/ 
gsettings set org.gnome.desktop.background picture-uri "file:///home/$user_name/Documents/bigsur.png"
gsettings set org.gnome.desktop.background picture-uri-dark "file:///home/$user_name/Documents/bigsur.png"

echo " "
echo "installing fonts..."
echo " "

sudo rm -rf /usr/share/fonts/truetype/noto/
sudo rm -rf /usr/share/fonts/truetype/victormono/
sudo cp -r fonts/* /usr/share/fonts/truetype/

echo " "
echo "applying all settings..."
echo " "

dconf load / < dconf/settings.dconf

echo " "
echo " "
read -p "reboot system... (y/n)? " -n 1 -r
echo    
if [[ $REPLY =~ ^[Yy]$ ]]
then
/sbin/reboot
fi

