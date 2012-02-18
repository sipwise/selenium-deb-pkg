# Purpose

This small project provides a way to build a Debian package of the
selenium-server jar file. This is useful if you want to roll out
selenium-server on your infrastructure via Debian repositories.

The build process will automatically download the selenium-server jar
file from Google code and put it into a binary Debian package. The
symlink /var/lib/selenium/selenium-server.jar will generated and
points to the actual selenium-server file, so you can use
/var/lib/selenium/selenium-server.jar in your startup/init script
without worrying about the selenium-server version too much.

# How to build

To build the Debian package just use the common way for Debian package
builds. If you don't know what this is about, you might just want to
run:

    % fakeroot debian/rules binary

# Adjust selenium-server version

Edit the configuration file _CONFIG_ and point the _version_ variable
to the selenium-server version you want to use. Do not forget to
adjust debian/changelog accordingly (preferably using the _dch_ tool).

# Resources

* [Debian Project](http://debian.org/)
* [Selenium Project](http://seleniumhq.org/)

# Author + License

Copyright 2012 Michael Prokop (mika (at) debian.org), Public Domain
