sudo dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install -y https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install -y gimp git shotwell ruby-devel libpng-devel optipng gcc-c++

if ! [ -x "$(command -v guetzli)" ]; then
	[[ -d guetzli ]] || git clone https://github.com/google/guetzli.git
	cd guetzli
	git pull
	make
	sudo cp bin/Release/guetzli /usr/bin;
fi

if ! [ -x "$(command -v google-chrome)" ]; then
	wget -c https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm
	sudo dnf -y --nogpgcheck localinstall google-chrome-stable_current_x86_64.rpm;
fi

if ! [ -x "$(command -v subl)" ]; then
	sudo rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg
	sudo dnf config-manager --add-repo https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo
	sudo dnf -y install sublime-text;
fi
