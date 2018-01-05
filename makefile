SHELL	= /bin/sh
ARCH	= mipsel
OSVER	= jessie
VARIANT	= minbase
DIR	= /chroot
URL	= http://httpredir.debian.org/debian
FLAGS	= --no-check-certificate --no-check-gpg
EXCLUDE	= adwaita-icon-theme,gsettings-desktop-schemas,hicolor-icon-theme,libgtk3-0,libgtk3-bin,libgtk3-common,x11-common
INCLUDE	= autoconf,automake,bmake,build-essential,dc,emacs,f2fs-tools,gcc,gfortran,git,htop,mg,mksh,screen,sudo,tmux

all:
	debootstrap --arch=$(ARCH) --variant=$(VARIANT) $(FLAGS) --include=$(INCLUDE) --exclude=$(EXCLUDE) $(OSVER) $(DIR) $(URL)
	echo 'deb http://ftp.us.debian.org/debian/ jessie main' > $(DIR)/etc/apt/sources.list
	echo 'deb-src http://ftp.us.debian.org/debian/ jessie main' > $(DIR)/etc/apt/sources.list
	echo 'deb http://ftp.us.debian.org/debian/ jessie-updates main' > $(DIR)/etc/apt/sources.list
	echo 'deb-src http://ftp.us.debian.org/debian/ jessie-updates main' > $(DIR)/etc/apt/sources.list
	echo 'deb http://security.debian.org/ jessie/updates main' > $(DIR)/etc/apt/sources.list
	echo 'deb-src http://security.debian.org/ jessie/updates main' > $(DIR)/etc/apt/sources.list
	echo 'deb http://ftp.debian.org/debian jessie-backports main' > $(DIR)/etc/apt/sources.list
