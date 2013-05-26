/usr/local/go/bin/go: /usr/local/go/src
	cd /usr/local/go/src; ./all.bash

/usr/local/go/src: /usr/local/go1.1.src.tar.gz
	cd /usr/local; tar xzf go1.1.src.tar.gz

/home/jdc/.profile.origo: /usr/local/go/bin/go
	echo 'PATH=$$PATH:/usr/local/go/bin' >> /home/jdc/.profile
