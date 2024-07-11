#!/bin/bash

# 添加阿里镜像源
#sudo zypper ar -fc 'https://mirrors.aliyun.com/opensuse/distribution/leap/$releasever/repo/oss' openSUSE-Aliyun-OSS
#sudo zypper ar -fc 'https://mirrors.aliyun.com/opensuse/distribution/leap/$releasever/repo/non-oss' openSUSE-Aliyun-NON-OSS
#sudo zypper ar -fc 'https://mirrors.aliyun.com/opensuse/update/leap/$releasever/oss' openSUSE-Aliyun-UPDATE-OSS
#sudo zypper ar -fc 'https://mirrors.aliyun.com/opensuse/update/leap/$releasever/non-oss' openSUSE-Aliyun-UPDATE-NON-OSS
#sudo zypper ar -fc 'https://mirrors.aliyun.com/opensuse/update/leap/$releasever/sle' openSUSE-Aliyun-Sle
#sudo zypper ar -fc 'https://mirrors.aliyun.com/opensuse/update/leap/$releasever/backports' openSUSE-Aliyun-Backports

# sudo zypper --gpg-auto-import-keys ar -c  'https://cdn.opensuse.org/update/leap/$releasever/sle/' repo-sle-update
# sudo zypper --gpg-auto-import-keys ar -c  'https://cdn.opensuse.org/update/leap/$releasever/backports/' repo-backports-update

# sudo zypper --gpg-auto-import-keys ar -c  'https://cdn.opensuse.org/debug/update/leap/$releasever/sle/' repo-sle-debug-update
# sudo zypper --gpg-auto-import-keys ar -c  'https://cdn.opensuse.org/update/leap/$releasever/backports_debug/' repo-backports-debug-update

# 添加软件源
# w32codec-all 需要该源
 sudo zypper --gpg-auto-import-keys ar -c  'https://packman.inode.at/suse/openSUSE_Leap_$releasever/' packman
# 第三方源
#sudo zypper ar -fc 'https://mirrors.aliyun.com/packman/suse/openSUSE_Leap_$releasever' openSUSE-Aliyun-Packman

# sudo zypper --gpg-auto-import-keys ar -fcg -p 90 'https://mirrors.ustc.edu.cn/packman/suse/openSUSE_Leap_$releasever/' packman

sudo zypper --gpg-auto-import-keys ar -c 'https://cdn.opensuse.org/repositories/home:/opensuse_zh/$releasever/' opensuse_zh
# sudo zypper --gpg-auto-import-keys ar -c 'https://cdn.opensuse.org/repositories/home:/jiarenlu/openSUSE_Leap_$releasever/' jiarenlu
sudo zypper --gpg-auto-import-keys ar -c  https://dl.google.com/linux/chrome/rpm/stable/$(uname -m) google-chrome

sudo zypper --gpg-auto-import-keys ar -c 'https://cdn.opensuse.org/repositories/editors/$releasever/' editors

sudo zypper --gpg-auto-import-keys ar -c 'https://cdn.opensuse.org/repositories/devel:/tools/$releasever/' devel:tools

# sudo zypper --gpg-auto-import-keys ar -c 'https://cdn.opensuse.org/repositories/Office/$releasever' office
sudo zypper --gpg-auto-import-keys ar -c 'https://cdn.opensuse.org/repositories/M17N:/fonts/$releasever/'  M17N:fonts
# sudo zypper --gpg-auto-import-keys ar -c 'https://cdn.opensuse.org/repositories/M17N/$releasever/' M17N

 # sudo zypper --gpg-auto-import-keys ar -c 'https://cdn.opensuse.org/repositories/Java:/Factory/SLE_15_SP4/' java


# sudo zypper --gpg-auto-import-keys ar -c 'https://cdn.opensuse.org/repositories/Virtualization/$releasever/' virtualization
# sudo zypper --gpg-auto-import-keys ar -c 'https://cdn.opensuse.org/repositories/Virtualization:/vagrant/$releasever/' vagrant

# sudo zypper --gpg-auto-import-keys ar -c 'https://cdn.opensuse.org/repositories/devel:/languages:/ruby:/extensions/$releasever/'  devel:languages:ruby:extensions
# sudo zypper --gpg-auto-import-keys ar -c 'https://cdn.opensuse.org/repositories/server:/database/$releasever/' server:database
# sudo zypper --gpg-auto-import-keys ar -c 'https://cdn.opensuse.org/repositories/devel:/languages:/nodejs/$releasever/' nodejs
# sudo zypper --gpg-auto-import-keys ar -c 'https://cdn.opensuse.org/repositories/devel:/gcc/$releasever/' gcc
# sudo zypper --gpg-auto-import-keys ar -c 'https://cdn.opensuse.org/repositories/devel:/languages:/php/$releasever/' php
# sudo zypper --gpg-auto-import-keys ar -c 'https://cdn.opensuse.org/repositories/devel:/languages:/python/$releasever/' python
# sudo zypper --gpg-auto-import-keys ar -c 'https://cdn.opensuse.org/repositories/devel:/languages:/python:/backports/$releasever/' python:backports
# sudo zypper --gpg-auto-import-keys ar -c 'https://cdn.opensuse.org/repositories/devel:/languages:/go/$releasever/' go
# sudo zypper --gpg-auto-import-keys ar -c 'https://cdn.opensuse.org/repositories/devel:/languages:/rust/$releasever/' rust
# sudo zypper --gpg-auto-import-keys ar -c 'https://cdn.opensuse.org/repositories/devel:/tools/$releasever/' devel:tools
# sudo zypper --gpg-auto-import-keys ar -c 'https://cdn.opensuse.org/repositories/server:/mail/$releasever/' mail
# sudo zypper --gpg-auto-import-keys ar -c 'https://cdn.opensuse.org/repositories/server:/database:/postgresql/$releasever' postgresql

# vs code
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ntype=rpm-md\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/zypp/repos.d/vscode.repo'

# vs codium
# sudo rpmkeys --import https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg
# printf "[vscodium]\nname=vs codium\nbaseurl=https://download.vscodium.com/rpms/\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg\nmetadata_expire=1h" | sudo tee -a /etc/zypp/repos.d/vscodium.repo

# sublime text
sudo rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg
sudo zypper addrepo -g -f https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo

# atom
# sudo sh -c 'echo -e "[Atom]\nname=Atom Editor\nbaseurl=https://packagecloud.io/AtomEditor/atom/el/7/\$basearch\nenabled=1\ntype=rpm-md\ngpgcheck=0\nrepo_gpgcheck=1\ngpgkey=https://packagecloud.io/AtomEditor/atom/gpgkey" > /etc/zypp/repos.d/atom.repo'
# sudo zypper --gpg-auto-import-keys refresh
sudo zypper --gpg-auto-import-keys refresh

# 刷新软件源并更新系统


# sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
# sudo zypper addrepo https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo
