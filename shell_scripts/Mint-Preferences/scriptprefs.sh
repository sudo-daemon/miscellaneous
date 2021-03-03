#Hardening security
cd ~
sudo ufw enable
sudo apt-get remove mono-runtime-common
sudo apt-get install firejail

#Fixing sound problems
mkdir -p ~/.config/pulse
cd ~/.config/pulse
cp -v /etc/pulse/client.conf ~/.config/pulse
echo "enable-shm = no" >> client.conf

sudo apt-get remove "openjdk*"

#Installing protonvpn
echo -n "Do you want to install ProtonVPN [y/n]?"
read answer

if [ "$answer" != "${answer#[Yy]}" ] ;then
    wget -q -O - https://repo.protonvpn.com/debian/public_key.asc | sudo apt-key add - 
    sudo add-apt-repository 'deb https://repo.protonvpn.com/debian unstable main'
    sudo apt-get update && sudo apt-get install protonvpn
else
    echo ProtonVPN not installed
fi


#Installing brave-browser
echo -n "Do you want to install Brave Browser [y/n]?"
read answer

if [ "$answer" != "${answer#[Yy]}" ] ;then
    sudo apt install apt-transport-https curl gnupg 
    curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
    echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
    sudo apt update && sudo apt install brave-browser
else
    echo Brave browser not installed
fi



#Installing themes and cursor
cd ~/Mint-Preferences/
tar -xzvf resources.tar.gz
sudo apt install xz-utils
mkdir ~/.icons
mkdir ~/.themes


echo -n "Do you want to install the extra theme [y/n]? "
read answer

if [ "$answer" != "${answer#[Yy]}" ] ;then
    cd ~/Mint-Preferences/resources/
    mv cursors.tar.gz ~/.icons
    cd ~/.icons
    tar -xzvf cursors.tar.gz
    sudo rm cursors.tar.gz
    cd ~/Mint-Preferences/resources/
    mv Tela-circle-red.tar.xz ~/.icons
    cd ~/.icons
    tar -xf Tela-circle-red.tar.xz
    sudo rm Tela-circle-red.tar.xz
    cd ~/Mint-Preferences/resources/
    mv macOS-Dark-6.1-dark.zip ~/.themes
    cd ~/.themes 
    unzip macOS-Dark-6.1-dark.zip
    sudo rm macOS-Dark-6.1-dark.zip
    sudo apt-get install plank
else
    echo Extra theme not installed
fi



echo If you chose to install the theming utilities, they have been installed. You can head to "Themes" and change the options to activate them.


#Installing the WiFi driver for my particular network card
echo -n "Do you want to install the network driver required for QCA9377 WiFi card- Not recommended if WiFi is working already [y/n]? "
read answer

if [ "$answer" != "${answer#[Yy]}" ] ;then
    cd /lib/firmware/ath10k/QCA9377/hw1.0/
    sudo mv firmware-5.bin firmware-5.bin.orig
    sudo mv firmware-6.bin firmware-6.bin.orig
    sudo wget "https://github.com/kvalo/ath10k-firmware/blob/master/QCA9377/hw1.0/CNSS.TF.1.0/firmware-5.bin_CNSS.TF.1.0-00267-QCATFSWPZ-1?raw=true" -O firmware-5.bin
    sudo modprobe -r ath10k_pci
    sudo modprobe ath10k_pci
else
     echo Extra WiFi driver not installed
fi



sudo apt-get update && sudo apt-get upgrade

#Updating grub
sudo update-grub

#Rebooting the system
echo -n "The system is about to reboot and clean up the remnants of uninstalled files. Reboot [y/n]? " 
read answer
if [ "$answer" != "${answer#[Yy]}" ] ;then
    reboot
else
    echo System will not reboot. 
fi

#------------------------------------------------------------------END OF ACTIVE CODE-----------------------------------------------------------------------------

#Creating a firejail-sandboxed Firefox desktop shortcut
#touch ~/Desktop/firefox.desktop
#chmod +x ~/Desktop/firefox.desktop
#echo 'Name=Firefox' >> ~/Desktop/firefox.desktop
#echo 'Comment=Firefox Web Browser' >> ~/Desktop/firefox.desktop
#echo 'Exec=firefox' >> ~/Desktop/firefox.desktop
#echo 'Type=Application' >> ~/Desktop/firefox.desktop
#echo 'Icon=~/Firefox' >> ~/Desktop/firefox.desktop
