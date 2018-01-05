SHELL	= /bin/sh
ARCH	= mipsel
OSVER	= jessie
VARIANT	= minbase
DIR	= /chroot
URL	= http://httpredir.debian.org/debian
FLAGS	= --no-check-certificate
INCLUDE	= autoconf,automake,bmake,build-essential,dc,emacs,f2fs-tools,gcc,gfortran,git,htop,libuser,mg,mksh,screen,sudo,tmux

all:
	debootstrap --arch=$(ARCH) --variant=$(VARIANT) $(FLAGS) --include=$(INCLUDE) $(OSVER) $(DIR) $(URL)
	cp sources.list $(DIR)/etc/apt/
