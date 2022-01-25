# set eopsinDesktop background
wget -O "${HOME}/Pictures/eopsinDesktop.png" "https://raw.githubusercontent.com/nispoe/overclock/main/images/eopsinDesktop.png"
gsettings set org.gnome.desktop.background picture-uri "file://${HOME}/Pictures/eopsinDesktop.png"

# install Google Chrome
sudo apt-get install libxss1 libappindicator1 libindicator7
sudo wget -O "${HOME}/Downloads/google-chrome-stable.deb" "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
sudo apt install "${HOME}/Downloads/google-chrome-stable.deb" -y

# install Visual Studio Code
sudo apt install code -y
