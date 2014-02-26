#!/bin/bash

if ! . ./CONFIG ; then
  echo "Error sourcing configuration file CONFIG" >&2
  exit 1
fi

# allow overriding via command line
if [ -n "$1" ] ; then
  version="$1"
fi


echo "Using selenium version $version (override via file CONFIG)"

if [ -n "$version" ] ; then
  jar="selenium-server-standalone-${version}.jar"
else
  echo "Error: \$version is unset." >&2
  exit 1
fi

create_symlink() {
  ln -sf "$jar" selenium-server.jar
}

if [ -r "$jar" ] ; then
  echo "File $jar exists already, nothing to do."
  create_symlink
  exit 0
fi

# release 2.40.0 is available in directory 2.40
minor_version=${version%.[0-9]}

echo "Downloading $jar (might take a while...)"
if wget --no-verbose -O "$jar" "http://selenium-release.storage.googleapis.com/${minor_version}/${jar}" ; then
  echo OK
else
  echo "ERROR" >&2
  exit 1
fi

if ! test -s "$jar" ; then
  echo "Empty $jar file." >&2
  exit 1
fi

create_symlink
