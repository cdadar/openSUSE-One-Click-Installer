#!/bin/bash

# 添加阿里镜像源
# zypper ar -fc 'https://mirrors.aliyun.com/opensuse/distribution/leap/$releasever/repo/oss' openSUSE-Aliyun-OSS
# zypper ar -fc 'https://mirrors.aliyun.com/opensuse/distribution/leap/$releasever/repo/non-oss' openSUSE-Aliyun-NON-OSS
# zypper ar -fc 'https://mirrors.aliyun.com/opensuse/update/leap/$releasever/oss' openSUSE-Aliyun-UPDATE-OSS
# zypper ar -fc 'https://mirrors.aliyun.com/opensuse/update/leap/$releasever/non-oss' openSUSE-Aliyun-UPDATE-NON-OSS
# zypper ar -fc 'https://mirrors.aliyun.com/opensuse/update/leap/$releasever/sle' openSUSE-Aliyun-Sle
# zypper ar -fc 'https://mirrors.aliyun.com/opensuse/update/leap/$releasever/backports' openSUSE-Aliyun-Backports

# zypper --gpg-auto-import-keys ar -c  'https://download.opensuse.org/update/leap/$releasever/sle/' repo-sle-update
# zypper --gpg-auto-import-keys ar -c  'https://download.opensuse.org/update/leap/$releasever/backports/' repo-backports-update

# zypper --gpg-auto-import-keys ar -c  'https://download.opensuse.org/debug/update/leap/$releasever/sle/' repo-sle-debug-update
# zypper --gpg-auto-import-keys ar -c  'https://download.opensuse.org/update/leap/$releasever/backports_debug/' repo-backports-debug-update

# 添加软件源
# w32codec-all 需要该源
zypper --gpg-auto-import-keys ar -c  'https://ftp.fau.de/packman/suse/openSUSE_Leap_$releasever/' packman
# zypper --gpg-auto-import-keys ar -c 'http://mirrors.aliyun.com/packman/$releasever' packman
# 第三方源
# zypper ar -fc 'https://mirrors.aliyun.com/packman/suse/openSUSE_Leap_$releasever' openSUSE-Aliyun-Packman

# zypper --gpg-auto-import-keys ar -fcg -p 90 'https://mirrors.ustc.edu.cn/packman/suse/openSUSE_Leap_$releasever/' packman

zypper --gpg-auto-import-keys ar -c 'https://download.opensuse.org/repositories/home:/opensuse_zh/$releasever/' opensuse_zh
zypper --gpg-auto-import-keys ar -c 'https://download.opensuse.org/repositories/home:/jiarenlu/$releasever/' home:jiarenlu
# zypper --gpg-auto-import-keys ar -c 'https://download.opensuse.org/repositories/home:/jiarenlu/openSUSE_Leap_$releasever/' jiarenlu

# wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub > linux_signing_key.pub
#  rpm --import linux_signing_key.pub
zypper --gpg-auto-import-keys ar -c  https://dl.google.com/linux/chrome/rpm/stable/$(uname -m) google-chrome

zypper --gpg-auto-import-keys ar -c 'https://download.opensuse.org/repositories/editors/$releasever/' editors
# zypper --gpg-auto-import-keys ar -c 'https://download.opensuse.org/repositories/editors:tree-sitter/$releasever' editors:tree-sitter
# zypper --gpg-auto-import-keys ar -c 'https://download.opensuse.org/repositories/network:/vpn/openSUSE_Leqp_$releasever/' network:vpn

# zypper --gpg-auto-import-keys ar -c 'https://download.opensuse.org/repositories/devel:/tools/$releasever/' devel:tools

# zypper --gpg-auto-import-keys ar -c 'https://download.opensuse.org/repositories/Office/$releasever' office
# zypper --gpg-auto-import-keys ar -c 'https://download.opensuse.org/repositories/M17N:/fonts/$releasever/'  M17N:fonts
# zypper --gpg-auto-import-keys ar -c 'https://download.opensuse.org/repositories/M17N/$releasever/' M17N

 # zypper --gpg-auto-import-keys ar -c 'https://download.opensuse.org/repositories/Java:/Factory/SLE_15_SP4/' java


# zypper --gpg-auto-import-keys ar -c 'https://download.opensuse.org/repositories/Virtualization/$releasever/' virtualization
# zypper --gpg-auto-import-keys ar -c 'https://download.opensuse.org/repositories/Virtualization:/vagrant/$releasever/' vagrant

# zypper --gpg-auto-import-keys ar -c 'https://download.opensuse.org/repositories/devel:/languages:/ruby:/extensions/$releasever/'  devel:languages:ruby:extensions
# zypper --gpg-auto-import-keys ar -c 'https://download.opensuse.org/repositories/server:/database/$releasever/' server:database
# zypper --gpg-auto-import-keys ar -c 'https://download.opensuse.org/repositories/devel:/languages:/nodejs/$releasever/' nodejs
# zypper --gpg-auto-import-keys ar -c 'https://download.opensuse.org/repositories/devel:/gcc/$releasever/' gcc
# zypper --gpg-auto-import-keys ar -c 'https://download.opensuse.org/repositories/devel:/languages:/php/$releasever/' php
# zypper --gpg-auto-import-keys ar -c 'https://download.opensuse.org/repositories/devel:/languages:/python/$releasever/' python
# zypper --gpg-auto-import-keys ar -c 'https://download.opensuse.org/repositories/devel:/languages:/python:/backports/$releasever/' python:backports
# zypper --gpg-auto-import-keys ar -c 'https://download.opensuse.org/repositories/devel:/languages:/go/$releasever/' go
# zypper --gpg-auto-import-keys ar -c 'https://download.opensuse.org/repositories/devel:/languages:/rust/$releasever/' rust
# zypper --gpg-auto-import-keys ar -c 'https://download.opensuse.org/repositories/devel:/tools/$releasever/' devel:tools
# zypper --gpg-auto-import-keys ar -c 'https://download.opensuse.org/repositories/server:/mail/$releasever/' mail
# zypper --gpg-auto-import-keys ar -c 'https://download.opensuse.org/repositories/server:/database:/postgresql/$releasever' postgresql

# vs code
 rpm --import https://packages.microsoft.com/keys/microsoft.asc
 sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ntype=rpm-md\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/zypp/repos.d/vscode.repo'

# vs codium
#  rpmkeys --import https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg
# printf "[vscodium]\nname=vs codium\nbaseurl=https://download.vscodium.com/rpms/\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg\nmetadata_expire=1h" |  tee -a /etc/zypp/repos.d/vscodium.repo

# sublime text
 rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg
zypper addrepo -g -f https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo

# atom
#  sh -c 'echo -e "[Atom]\nname=Atom Editor\nbaseurl=https://packagecloud.io/AtomEditor/atom/el/7/\$basearch\nenabled=1\ntype=rpm-md\ngpgcheck=0\nrepo_gpgcheck=1\ngpgkey=https://packagecloud.io/AtomEditor/atom/gpgkey" > /etc/zypp/repos.d/atom.repo'
# zypper --gpg-auto-import-keys refresh
# brave
 rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
zypper addrepo https://brave-browser-rpm-release.s3.brave.com/x86_64/ brave-browser

zypper --gpg-auto-import-keys refresh

# 刷新软件源并更新系统


#  rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
# zypper addrepo https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo
