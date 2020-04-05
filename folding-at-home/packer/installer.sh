!#/bin/bash

# Download backages
wget https://download.foldingathome.org/releases/public/release/fahclient/debian-testing-64bit/v7.4/fahclient_7.4.4_amd64.deb
wget https://download.foldingathome.org/releases/public/release/fahcontrol/debian-testing-64bit/v7.4/fahcontrol_7.4.4-1_all.deb
wget https://download.foldingathome.org/releases/public/release/fahviewer/debian-testing-64bit/v7.4/fahviewer_7.4.4_amd64.deb

# Install packages
sudo dpkg -i --force-depends fahclient_7.4.4_amd64.deb
sudo dpkg -i --force-depends fahcontrol_7.4.4-1_all.deb
sudo dpkg -i --force-depends fahviewer_7.4.4_amd64.deb