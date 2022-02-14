#!/bin/bash

# 添加阿里镜像源
#sudo zypper ar -fc 'https://mirrors.aliyun.com/opensuse/distribution/leap/$releasever/repo/oss' openSUSE-Aliyun-OSS
#sudo zypper ar -fc 'https://mirrors.aliyun.com/opensuse/distribution/leap/$releasever/repo/non-oss' openSUSE-Aliyun-NON-OSS
#sudo zypper ar -fc 'https://mirrors.aliyun.com/opensuse/update/leap/$releasever/oss' openSUSE-Aliyun-UPDATE-OSS
#sudo zypper ar -fc 'https://mirrors.aliyun.com/opensuse/update/leap/$releasever/non-oss' openSUSE-Aliyun-UPDATE-NON-OSS
# 第三方源
#sudo zypper ar -fc 'https://mirrors.aliyun.com/packman/openSUSE_Leap_$releasever' openSUSE-Aliyun-Packman
# 添加软件源
# w32codec-all 需要该源
# sudo zypper --gpg-auto-import-keys ar -c  'http://download.opensuse.org/update/leap/$releasever/sle/' repo-sle-update
# sudo zypper --gpg-auto-import-keys ar -c  'http://download.opensuse.org/update/leap/$releasever/backports/' repo-backports-update

# sudo zypper --gpg-auto-import-keys ar -c  'http://download.opensuse.org/debug/update/leap/$releasever/sle/' repo-sle-debug-update
# sudo zypper --gpg-auto-import-keys ar -c  'http://download.opensuse.org/update/leap/$releasever/backports_debug/' repo-backports-debug-update

# sudo zypper --gpg-auto-import-keys ar -c  'https://packman.inode.at/suse/openSUSE_Leap_$releasever/' packman

sudo zypper --gpg-auto-import-keys ar -fcg -p 90 'https://mirrors.ustc.edu.cn/packman/suse/openSUSE_Leap_$releasever/' packman

sudo zypper --gpg-auto-import-keys ar -c 'https://download.opensuse.org/repositories/home:/opensuse_zh/openSUSE_Leap_$releasever/' opensuse_zh
# sudo zypper --gpg-auto-import-keys ar -c 'https://download.opensuse.org/repositories/home:/jiarenlu/openSUSE_Leap_$releasever/' jiarenlu
sudo zypper --gpg-auto-import-keys ar -c  https://dl.google.com/linux/chrome/rpm/stable/$(uname -m) google-chrome
# sudo zypper --gpg-auto-import-keys ar -c 'https://download.opensuse.org/repositories/Virtualization/openSUSE_Leap_$releasever/' virtualization
# sudo zypper --gpg-auto-import-keys ar -c 'https://download.opensuse.org/repositories/Virtualization:/vagrant/openSUSE_Leap_$releasever/' vagrant
# sudo zypper --gpg-auto-import-keys ar -c 'https://download.opensuse.org/repositories/devel:/languages:/ruby:/extensions/openSUSE_Leap_$releasever/'  devel:languages:ruby:extensions
sudo zypper --gpg-auto-import-keys ar -c 'https://download.opensuse.org/repositories/editors/openSUSE_Leap_$releasever/' editors
# sudo zypper --gpg-auto-import-keys ar -c 'https://download.opensuse.org/repositories/utilities/openSUSE_Leap_$releasever/' utilities
# sudo zypper --gpg-auto-import-keys ar -c 'https://download.opensuse.org/repositories/Office/openSUSE_Leap_$releasever' office
sudo zypper --gpg-auto-import-keys ar -c 'https://download.opensuse.org/repositories/M17N:/fonts/openSUSE_Leap_$releasever/'  M17N:fonts
sudo zypper --gpg-auto-import-keys ar -c 'https://download.opensuse.org/repositories/M17N/openSUSE_Leap_$releasever/' M17N
# sudo zypper --gpg-auto-import-keys ar -c 'https://adoptopenjdk.jfrog.io/adoptopenjdk/rpm/opensuse/$releasever/'$(uname -m)/ adoptopenjdk
# sudo zypper --gpg-auto-import-keys ar -c 'http://download.opensuse.org/repositories/Java:/Factory/openSUSE_Leap_$releasever/' java
# sudo zypper --gpg-auto-import-keys ar -c 'http://download.opensuse.org/repositories/Java:/Factory/SLE_15_SP3/' java
# sudo zypper --gpg-auto-import-keys ar -c 'https://download.opensuse.org/repositories/server:/database/openSUSE_Leap_$releasever/' server:database
# sudo zypper --gpg-auto-import-keys ar -c 'https://download.opensuse.org/repositories/devel:/languages:/nodejs/openSUSE_Leap_$releasever/' nodejs
# sudo zypper --gpg-auto-import-keys ar -c 'https://download.opensuse.org/repositories/devel:/gcc/openSUSE_Leap_$releasever/' gcc
# sudo zypper --gpg-auto-import-keys ar -c 'https://download.opensuse.org/repositories/devel:/languages:/php/openSUSE_Leap_$releasever/' php
# sudo zypper --gpg-auto-import-keys ar -c 'https://download.opensuse.org/repositories/devel:/languages:/python/openSUSE_Leap_$releasever/' python
# sudo zypper --gpg-auto-import-keys ar -c 'https://download.opensuse.org/repositories/devel:/languages:/go/openSUSE_Leap_$releasever/' go
# sudo zypper --gpg-auto-import-keys ar -c 'https://download.opensuse.org/repositories/devel:/languages:/rust/openSUSE_Leap_$releasever/' rust
# sudo zypper --gpg-auto-import-keys ar -c 'https://download.opensuse.org/repositories/devel:/tools/openSUSE_Leap_$releasever/' devel:tools
# sudo zypper --gpg-auto-import-keys ar -c 'https://download.opensuse.org/repositories/server:/mail/openSUSE_Leap_$releasever/' mail
# sudo zyppr --gpg-auto-import-keys ar -c  'https://download.opensuse.org/repositories/server:/database:/postgresql/openSUSE_Leap_$releasever' postgresql
# sudo zypper --gpg-auto-import-keys ar -c 'https://download.opensuse.org/repositories/devel:/languages:/nodejs/openSUSE_Leap_$releasever/' nodejs
# sudo zypper --gpg-auto-import-keys ar -c 'https://download.opensuse.org/repositories/devel:/languages:/php/openSUSE_Leap_$releasever/' php
# sudo zypper --gpg-auto-import-keys ar -c 'https://download.opensuse.org/repositories/devel:/languages:/go/openSUSE_Leap_$releasever/' go
# sudo zypper --gpg-auto-import-keys ar -c 'https://download.opensuse.org/repositories/devel:/languages:/rust/openSUSE_Leap_$releasever/' rust
# sudo zypper --gpg-auto-import-keys ar -c 'https://download.opensuse.org/repositories/devel:/tools/openSUSE_Leap_$releasever/' devel:tools
# sudo zypper --gpg-auto-import-keys ar -c 'https://download.opensuse.org/repositories/server:/mail/openSUSE_Leap_$releasever/' mail
# sudo zyppr --gpg-auto-import-keys ar -c  'https://download.opensuse.org/repositories/server:/database:/postgresql/openSUSE_Leap_$releasever' postgresql

# vs code
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ntype=rpm-md\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/zypp/repos.d/vscode.repo'

# vs codium
sudo rpmkeys --import https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg
printf "[vscodium]\nname=vs codium\nbaseurl=https://download.vscodium.com/rpms/\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg\nmetadata_expire=1h" | sudo tee -a /etc/zypp/repos.d/vscodium.repo

# sublime text
sudo rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg
sudo zypper addrepo -g -f https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo

# atom
sudo sh -c 'echo -e "[Atom]\nname=Atom Editor\nbaseurl=https://packagecloud.io/AtomEditor/atom/el/7/\$basearch\nenabled=1\ntype=rpm-md\ngpgcheck=0\nrepo_gpgcheck=1\ngpgkey=https://packagecloud.io/AtomEditor/atom/gpgkey" > /etc/zypp/repos.d/atom.repo'
sudo zypper --gpg-auto-import-keys refresh

# 刷新软件源并更新系统
