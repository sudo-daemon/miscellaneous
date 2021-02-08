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
