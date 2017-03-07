#!/bin/sh

# make sure all users on this machine are members of the _developer group
/usr/sbin/dseditgroup -o edit -a everyone -t group _developer

# enable developer mode
/usr/sbin/DevToolsSecurity -enable

# accept Xcode license
/Applications/Xcode.app/Contents/Developer/usr/bin/xcodebuild -license accept

# install embedded packages
for PKG in /Applications/Xcode.app/Contents/Resources/Packages/*.pkg; do
    /usr/sbin/installer -pkg "$PKG" -target /
done
