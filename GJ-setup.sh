#!/bin/sh

#CREATED BY G0LDENJ0KER

#Script for automaticly downloading and installing/compiling my customized stuff: dwm, st and etc.


echo "Installing dependencies..."
sudo apt install git libx11-dev debhelper bison check cmake flex ghostscript libbsd-dev libcurl4-openssl-dev libgeoip-dev libltdl-dev libluajit-5.1-dev libncurses5-dev libnet1-dev libpcap-dev libpcre3-dev libssl-dev libgtk-3-dev libgtk2.0-dev compton nitrogen unzip wget surf scrot -y

git clone https://github.com/G0ldenJ0ker/src.git ~/src/

echo "compiling dwm..."
cd ~/src/dwm/
sudo make clean install
sudo cp ~/src/dwm.desktop /usr/share/xsessions/


echo "compiling dwmblocks..."
cd ~/src/dwmblocks/
sudo make clean install


echo "compiling dmenu..."
cd ~/src/dmenu/
sudo make clean install


echo "compiling st..."
cd ~/src/st/
sudo make clean install


echo "Setting up autostart script..."
mkdir ~/.dwm/
cp ~/src/autostart.sh ~/.dwm/


echo "Setting up other scripts..."
chmod +x ~/src/scripts/*
sudo cp ~/src/scripts/* /bin/


echo "Setting up fonts..."
sudo mkdir /usr/share/fonts/JetBrainsMono/
sudo cp ~/src/fonts/JetBrainsMono.zip /usr/share/fonts/JetBrainsMono/
sudo cd /usr/share/fonts/JetBrainsMono/
sudo unzip JetBrainsMono.zip


echo "Setting up wallpapers..."
mkdir ~/Pictures/
mkdir ~/Pictures/wallpapers/
cp ~/src/wallpapers/* ~/Pictures/wallpapers/


echo "Setting up bash..."
mv ~/.bashrc ~/.bashrc.old
cp ~/src/bashrc ~/.bashrc


echo("Setting up neovim...")
wget https://github.com/neovim/neovim/releases/download/v0.6.0/nvim.appimage
sudo mv nvim.appimage /bin/nvim
sudo chmod +x /bin/nvim
mkdir .config
cp ~/src/nvim.zip ~/.config/
cd .config/
mv nvim/ nvim.old/
unzip nvim.zip
