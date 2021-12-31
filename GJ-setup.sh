#!/bin/sh

#CREATED BY G0LDENJ0KER

#Script for automaticly downloading and installing/compiling my customized stuff: dwm, st and etc.

git clone https://github.com/G0ldenJ0ker/src.git ~/src


echo("Installing dependencies...")
sudo apt install libx11-dev debhelper bison check cmake flex ghostscript libbsd-dev libcurl4-openssl-dev libgeoip-dev libltdl-dev libluajit-5.1-dev libncurses5-dev libnet1-dev libpcap-dev libpcre3-dev libssl-dev libgtk-3-dev libgtk2.0-dev compton nitrogen unzip wget surf -y


echo("compiling dwm...")
cd ~/src/dwm/
sudo make clean install


echo("compiling dwmblocks...")
cd ~/src/dwmblocks/
sudo make clean install


echo("compiling dmenu...")
cd ~/src/dmenu/
sudo make clean install


echo("compiling st...")
cd ~/src/st/
sudo make clean install


echo("Setting up autostart script...")
mkdir ~/.dwm/
cp ~/src/autostart.sh ~/.dwm/


echo("Setting up other scripts...")
sudo cp ~/src/scripts/* /bin/


echo("Setting up fonts...")
sudo mkdir /usr/share/fonts/JetBrainsMono/
sudo cp ~/src/fonts/JetBrainsMono.zip /usr/share/fonts/JetBrainsMono/
sudo cd /usr/share/fonts/JetBrainsMono/
unzip JetBrainsMono.zip


echo("Setting up wallpapers...")
mkdir ~/Pictures/
mkdir ~/Pictures/wallpapers/
cp ~/src/wallpapers/* ~/Pictures/wallpapers/


echo("Setting up bash...")
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
