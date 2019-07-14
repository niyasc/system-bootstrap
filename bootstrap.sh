PKG_MNGER=$1

if [ -z $PKG_MNGER ]
then
	PKG_MNGER='apt'
fi

echo "Identified packager manager $PKG_MNGER"

sudo $PKG_MNGER install git ruby-bundler gimp python python-pip python-yaml ruby-dev libssl-dev -y

sudo pip install --upgrade google-api-python-client

sudo pip install --upgrade oauth2client