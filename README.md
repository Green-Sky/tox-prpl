# tox-prpl

Tox Pidgin Protocol Plugin


## Dependencies

* glib: should be available in the repositories of your distribution
* ncurses: should be in your repo
* [libpurple](https://developer.pidgin.im/) (should be in your repo as well)
* [libsodium](https://download.libsodium.org/libsodium/releases/)
* [Tox](https://github.com/TokTok/c-toxcore/)

Additionally you will need gcc, autoconf, automake, libtool and maybe
a few other things for actually compiling the code.


I assume that you can install the development packages for libpurple and
glib using your favorite package manager, same goes for development tools,
so I'll only walk you through the steps for libsodium and Tox.

Usually I prefer not to install software system wide which does not come as
a distribution package (i.e. if there is no .rpm, .deb, etc.).

In the example below, replace "youruser" with your actual user name. If you
do not provide the prefix, the installation will go to /usr/local/ which will
require root priveleges for the _make install_ step.


### libsodium

If you cloned libsodium from git you will have to run ./autogen.sh to generate
the configure script, if you downloaded a release tarball then configure will
already be there.

	./configure --prefix=/home/youruser/Tox/sysroot
	make
	make install

This will install libsodium headers in /home/youruser/Tox/sysroot/include
and the library in /home/youruser/Tox/sysroot/lib.

Remember the /home/youruser/Tox/sysroot/ path, we will need it later on.


### Tox core

Generate the configure script:

	autoreconf -i

Tell configure where to find dependencies and where to install the library,
compile and install:

	./configure --with-dependency-search=/home/youruser/Tox/sysroot/ --prefix=/home/youruser/Tox/sysroot/
	make
	make install


## Building tox-prpl

Generate the configure script:

	autoreconf -i

Tell configure where to find dependencies and where to install the plugin,
compile and install:

	./configure --with-dependency-search=/home/youruser/Tox/sysroot/ --prefix=/home/youruser/Tox/sysroot/
	make
	make install

Unless you also compiled pidgin and installed it in your above "sysroot", the
plugin will not be found, so as a last step you need to:

	mkdir ~/.purple/plugins/
	cp /home/youruser/Tox/sysroot/lib/purple-2/libtox.so ~/.purple/plugins/

If you used a non standard installation location for the library, as above,
then you have to add it to your environment before running pidgin.

In the terminal where you start pidgin (assuming bash):

	export LD_LIBRARY_PATH=/home/youruser/Tox/sysroot/lib

Now you are ready to start pidgin and to test the plugin.
