/usr/inferno/usr/jdc: /usr/inferno/Linux/arm/bin/emu
	cd /usr/inferno/usr; cp -p -r inferno jdc

/usr/inferno/Linux/arm/bin/emu: /usr/inferno/Linux/arm/bin/mk #/usr/inferno/emu/Linux/os.c.orig
	cd /usr/inferno; export PATH=$$PATH:/usr/inferno/Linux/arm/bin; mk nuke; mk install

/usr/inferno/Linux/arm/bin/mk: /usr/inferno/mkconfig.orig /usr/inferno/mkfiles/mkfile-Linux-arm.orig
	cd /usr/inferno; ./makemk.sh

/usr/inferno/mkconfig.orig: /usr/inferno/INSTALL
	cd /usr/inferno; cp mkconfig mkconfig.orig; sed 's,SYSHOST=Plan9,SYSHOST=Linux,;s,#OBJTYPE=386,OBJTYPE=arm,;s,OBJTYPE=$$objtype,#OBJTYPE=$$objtype,' mkconfig.orig > mkconfig

/usr/inferno/mkfiles/mkfile-Linux-arm.orig: /usr/inferno/INSTALL
	cd /usr/inferno/mkfiles; cp mkfile-Linux-arm mkfile-Linux-arm.orig; sed 's,arm-gcc,gcc,' mkfile-Linux-arm.orig > mkfile-Linux-arm

#/usr/inferno/emu/Linux/os.c.orig: /usr/inferno/INSTALL
#	cd /usr/inferno/emu/Linux; cp os.c os.c.orig; sed -f /home/jdc/includelinuxschedh.sed os.c.orig > os.c

/usr/inferno/INSTALL: /usr/inferno-20130518.tgz
	cd /usr; tar xzf inferno-20130518.tgz
