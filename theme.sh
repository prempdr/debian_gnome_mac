#!/bin/bash

./install.sh -m -HD -N mojave -l --right
./tweaks.sh -F
sudo flatpak override --filesystem=xdg-config/gtk-4.0
sudo ./tweaks.sh -g

