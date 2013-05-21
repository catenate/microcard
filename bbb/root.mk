all: /home/jdc /usr/inferno /usr/inferno-20130518.tgz /usr/local/plan9port

/home/jdc:
	useradd jdc
	passwd jdc

/usr/inferno-20130518.tgz:
	cd /usr; wget http://dl.dropboxusercontent.com/u/502901/inferno-20130518.tgz

/usr/inferno: 
	cd /usr; mkdir inferno; chown jdc inferno

/usr/local: 
	cd /usr; mkdir local

/usr/local/plan9: /usr/local
	cd /usr/local; mv plan9port plan9

/usr/local/plan9port: /usr/local /usr/local/plan9port-20130320.tgz
	cd /usr/local; mkdir plan9port; chown jdc plan9port

/usr/local/plan9port-20130320.tgz:
	cd /usr/local; wget http://plan9port.googlecode.com/files/plan9port-20130320.tgz

libxt-dev_1.1.2-r0_armv7a.ipk: 
	wget http://www.angstrom-distribution.org/feeds/v2012.05/ipk/eglibc/armv7a/base/libxt-dev_1.1.2-r0_armv7a.ipk

/usr/include/X11/IntrinsicP.h: libxt-dev_1.1.2-r0_armv7a.ipk
	opkg install $<
