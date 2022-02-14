#!/bin/bash

# 添加软件源
# w32codec-all 需要该源
# sudo zypper --gpg-auto-import-keys ar -c  http://packman.inode.at/suse/openSUSE_Tumbleweed/ packman
sudo zypper ar -cfp 90 https://ftp.gwdg.de/pub/linux/misc/packman/suse/openSUSE_Tumbleweed/ packman

sudo zypper --gpg-auto-import-keys ar -c http://download.opensuse.org/repositories/home:/opensuse_zh/openSUSE_Tumbleweed/ opensuse_zh
sudo zypper --gpg-auto-import-keys ar -c http://download.opensuse.org/repositories/M17N:/fonts/openSUSE_Tumbleweed/  M17N:fonts
# sudo zypper --gpg-auto-import-keys ar http://repo.fdzh.org/chrome/ google-chrome-stable
sudo zypper --gpg-auto-import-keys ar -c  http://dl.google.com/linux/chrome/rpm/stable/$(uname -m) google-chrome
# vs code
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ntype=rpm-md\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/zypp/repos.d/vscode.repo'

# vscodium
sudo rpmkeys --import https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg
printf "[vscodium]\nname=vs codium\nbaseurl=https://download.vscodium.com/rpms/\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg\nmetadata_expire=1h" | sudo tee -a /etc/zypp/repos.d/vscodium.repo

# sublime text
sudo rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg
sudo zypper addrepo -g -f https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo

# 刷新软件源并更新系统
