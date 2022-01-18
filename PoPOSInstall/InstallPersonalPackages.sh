# adding multiverse repository
sudo add-apt-repository multiverse -y
sudo apt update -y
sudo apt upgrade -y

# set eopsinDesktop background
wget -O "${HOME}/Pictures/eopsinDesktop.png" "https://raw.githubusercontent.com/nispoe/overclock/main/images/eopsinDesktop.png"
gsettings set org.gnome.desktop.background picture-uri "file://${HOME}/Pictures/eopsinDesktop.png"

# install steam
sudo apt install steam -y

# install Visual Studio Code
sudo apt install code -y

# install Google Chrome
sudo apt-get install libxss1 libappindicator1 libindicator7
sudo wget -O "${HOME}/Downloads/google-chrome-stable_current_amd64.deb" "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
sudo apt install "${HOME}/Downloads/google-chrome-stable_current_amd64.deb" -y