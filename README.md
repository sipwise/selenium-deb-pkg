# Purpose

selenium-deb-pkg implements a simple way to build a Debian package of
the selenium-server. This is useful if you want to roll out
selenium-server on your infrastructure using Debian repositories.

The build step will automatically download the selenium-server jar
file from Google code and put it into a binary Debian package.  A
symlink /var/lib/selenium/selenium-server.jar will generated to point
to the actual selenium-server file, so you can use
/var/lib/selenium/selenium-server.jar in your startup/init script
without worrying about the selenium-server version.

# How to build

To build the Debian package just use the common way for Debian package
builds. If you don't know what this is about, you might just want to
run:

  % fakeroot debian/rules binary

# Adjust selenium-server version

Edit the configuration file CONFIG and point the 'version' variable to
the version of selenium-server you want to use. Do not forget to
adjust debian/changelog accordingly.
