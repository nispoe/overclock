# adding multiverse repository
sudo add-apt-repository multiverse -y
sudo apt update -y
sudo apt upgrade -y

# set eopsinDesktop background
wget "https://raw.githubusercontent.com/nispoe/overclock/main/images/eopsinDesktop.png" "${HOME}/Pictures"
gsettings set org.gnome.desktop.background picture-uri "file:///${HOME}/Pictures/eopsinDesktop.png"

# install steam
sudo apt install steam -y

# install Visual Studio Code
sudo apt install code -y

# install Google Chrome
sudo apt-get install libxss1 libappindicator1 libindicator7
sudo wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb "${HOME}/Downloads"
sudo apt install "./Downloads/google-chrome*.deb -y"