PKG_MNGER=$1

if [ -z $PKG_MNGER ]
then
	PKG_MNGER='apt'
fi

echo "Identified packager manager $PKG_MNGER"

# Adding repositories
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -


sudo apt update

sudo $PKG_MNGER remove thunderbird eog rhythmbox
sudo $PKG_MNGER autoremove


sudo apt upgrade -y
sudo $PKG_MNGER install optipng git nodejs libc-dev g++ ruby-bundler gimp python python-pip python-yaml ruby-dev libssl-dev imagemagick guetzli transmission-gtk python-setuptools vim -y

wget -c https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

sudo dpkg -i --force-depends google-chrome-stable_current_amd64.deb

sudo apt install -f

sudo pip install --upgrade google-api-python-client

sudo pip install --upgrade oauth2client

# Install sublime
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt install sublime-text

