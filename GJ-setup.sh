#!/bin/bash

#CREATED BY G0LDENJ0KER

#Script for automaticly downloading and installing/compiling my customized stuff: dwm, st and etc.


echo "========================================================================="
echo "1. Apt";
echo "2. Pacman";
read -p 'Which package manager do you use?: ' "var"
echo "========================================================================="

echo "Installing dependencies..."
if [ $var == "1" ];
then
        sudo apt update
	sudo apt install git libx11-dev debhelper bison check cmake flex ghostscript libbsd-dev libcurl4-openssl-dev libgeoip-dev libltdl-dev libluajit-5.1-dev libncurses5-dev libnet1-dev libpcap-dev libpcre3-dev libssl-dev libgtk-3-dev libgtk2.0-dev compton feh unzip wget surf scrot -y

else [ $var == "2" ];
	sudo pacman -Sy --noconfirm git libx11-dev bison check cmake flex ghostscript libbsd-dev libcurl4-openssl-dev libgeoip-dev libltdl-dev libluajit-5.1-dev libncurses5-dev libnet1-dev libpcap-dev libpcre3-dev libssl-dev libgtk-3-dev libgtk2.0-dev compton feh unzip wget surf scrot -y

fi


git clone https://github.com/G0ldenJ0ker/src.git ~/src/

echo "=============================================================================="
echo "compiling dwm..."
cd ~/src/dwm/
sudo make clean install
sudo cp ~/src/dwm.desktop /usr/share/xsessions/
echo "Done!"
echo "=============================================================================="

echo"==============================================================================="
echo "compiling dwmblocks..."
cd ~/src/dwmblocks/
sudo make clean install
echo "Done!"
echo "=============================================================================="

echo "=============================================================================="
echo "compiling dmenu..."
cd ~/src/dmenu/
sudo make clean install
echo "Done!"
echo "=============================================================================="

echo "=============================================================================="
echo "compiling st..."
cd ~/src/st/
sudo make clean install
echo "Done!"
echo "=============================================================================="

echo "=============================================================================="
echo "Setting up autostart script..."
mkdir ~/.dwm/
cp ~/src/autostart.sh ~/.dwm/
echo "Done!"
echo "============================================================================="

echo"=============================================================================="
echo "Setting up other scripts..."
chmod +x ~/src/scripts/*
sudo cp ~/src/scripts/* /bin/
echo "Done!"
echo"=============================================================================="

echo"=============================================================================="
echo "Setting up fonts..."
sudo mkdir /usr/share/fonts/JetBrainsMono/
sudo cp ~/src/fonts/JetBrainsMono.zip /usr/share/fonts/JetBrainsMono/
sudo cd /usr/share/fonts/JetBrainsMono/
sudo unzip JetBrainsMono.zip
echo "Done!"
echo "=============================================================================="

echo "=============================================================================="
echo "Setting up wallpapers..."
mkdir ~/Pictures/
mkdir ~/Pictures/wallpapers/
cp ~/src/wallpapers/* ~/Pictures/wallpapers/
echo "Done!"
echo "=============================================================================="

echo "=============================================================================="
echo "Setting up bash..."
mv ~/.bashrc ~/.bashrc.old
cp ~/src/.bashrc ~/.bashrc
echo "Done!"
echo "=============================================================================="

echo "=============================================================================="
echo "Setting up neovim..."
sudo curl -o /bin/nvim https://github.com/neovim/neovim/releases/download/v0.6.0/nvim.appimage
sudo chmod +x /bin/nvim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
cp ~/.config/nvim/ ~/.config/nvim-old/
mkdir ~/.config/nvim/
cp ~/src/init.vim ~/.config/nvim/init.vim
echo "Done!"
echo "=============================================================================="

echo "=============================================================================="
sudo mkdir /usr/share/xsessions/
sudo cp ~/src/dwm.desktop /usr/share/xsessions/
echo "Done!"
echo "=============================================================================="

echo " "
echo "DONE!"
