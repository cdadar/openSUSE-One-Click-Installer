#!/bin/bash

# 修改语言为英语，确保命令的输出都是英语，这样对命令输出的处理就不会出错了
OLD_LANG=$LANG
export LANG=default
SCRIPT_DIR=$(dirname $0)
read -p "你确定继续吗？ (Y|n) : " confirm_continue
if [ -z "$confirm_continue" ]; then
    confirm_continue="Y"
fi
if [ "$confirm_continue" == "n" -o "$confirm_continue" == "no" ]; then
    exit
fi
sudo zypper -n in -l lsb-release
# 添加阿里镜像源
#sudo zypper ar -fc 'https://mirrors.aliyun.com/opensuse/distribution/leap/$releasever/repo/oss' openSUSE-Aliyun-OSS
#sudo zypper ar -fc 'https://mirrors.aliyun.com/opensuse/distribution/leap/$releasever/repo/non-oss' openSUSE-Aliyun-NON-OSS
#sudo zypper ar -fc 'https://mirrors.aliyun.com/opensuse/update/leap/$releasever/oss' openSUSE-Aliyun-UPDATE-OSS
#sudo zypper ar -fc 'https://mirrors.aliyun.com/opensuse/update/leap/$releasever/non-oss' openSUSE-Aliyun-UPDATE-NON-OSS
# 第三方源
#sudo zypper ar -fc 'https://mirrors.aliyun.com/packman/openSUSE_Leap_$releasever' openSUSE-Aliyun-Packman
# 添加软件源
# w32codec-all 需要该源
# sudo zypper --gpg-auto-import-keys ar -c  'https://packman.inode.at/suse/openSUSE_Leap_$releasever/' packman
sudo zypper --gpg-auto-import-keys ar -fcg -p 90 'https://mirrors.ustc.edu.cn/packman/suse/openSUSE_Leap_$releasever/' packman

sudo zypper --gpg-auto-import-keys ar -c 'https://download.opensuse.org/repositories/home:/opensuse_zh/openSUSE_Leap_$releasever/' opensusu_zh
# sudo zypper --gpg-auto-import-keys ar -c 'https://download.opensuse.org/repositories/home:/jiarenlu/openSUSE_Leap_$releasever/' jiarenlu
sudo zypper --gpg-auto-import-keys ar -c  https://dl.google.com/linux/chrome/rpm/stable/$(uname -m) google-chrome
# sudo zypper --gpg-auto-import-keys ar -c 'https://download.opensuse.org/repositories/Virtualization/openSUSE_Leap_$releasever/' virtualization
# sudo zypper --gpg-auto-import-keys ar -c 'https://download.opensuse.org/repositories/Virtualization:/vagrant/openSUSE_Leap_$releasever/' vagrant
# sudo zypper --gpg-auto-import-keys ar -c 'https://download.opensuse.org/repositories/devel:/languages:/ruby:/extensions/openSUSE_Leap_$releasever/'  devel:languages:ruby:extensions
sudo zypper --gpg-auto-import-keys ar -c 'https://download.opensuse.org/repositories/editors/openSUSE_Leap_$releasever/' editors
sudo zypper --gpg-auto-import-keys ar -c 'https://download.opensuse.org/repositories/utilities/openSUSE_Leap_$releasever/' utilities
# sudo zypper --gpg-auto-import-keys ar -c 'https://download.opensuse.org/repositories/Office/openSUSE_Leap_$releasever' office
sudo zypper --gpg-auto-import-keys ar -c 'https://download.opensuse.org/repositories/M17N:/fonts/openSUSE_Leap_$releasever/'  M17N:fonts
# sudo zypper --gpg-auto-import-keys ar -c 'https://download.opensuse.org/repositories/M17N/openSUSE_Leap_$releasever/' M17N
# sudo zypper --gpg-auto-import-keys ar -c 'https://adoptopenjdk.jfrog.io/adoptopenjdk/rpm/opensuse/$releasever/'$(uname -m)/ adoptopenjdk
# sudo zypper --gpg-auto-import-keys ar -c 'https://download.opensuse.org/repositories/server:/database/openSUSE_Leap_$releasever/' server:database
# sudo zypper --gpg-auto-import-keys ar -c 'https://download.opensuse.org/repositories/devel:/languages:/nodejs/openSUSE_Leap_$releasever/' nodejs
# sudo zypper --gpg-auto-import-keys ar -c 'https://download.opensuse.org/repositories/devel:/gcc/openSUSE_Leap_$releasever/' gcc
# sudo zypper --gpg-auto-import-keys ar -c https://download.opensuse.org/repositories/devel:/languages:/php/openSUSE_Leap_$releasever/' php
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
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ntype=rpm-md\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/zypp/repos.d/vscode.repo'
# sudo rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg
# sudo zypper addrepo -g -f https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo
# 刷新软件源并更新系统
# sudo zypper al libqt5-qtbase-platformtheme-gtk3 libqt5-qtstyleplugins-platformtheme-gtk2
sudo zypper --gpg-auto-import-keys ref
sudo zypper -n update -l
# 安装 gstreamer 相关插件，这样基于 phonon 框架的多媒体软件就可以播放受专利保护的多媒体文件了
sudo zypper -n in -l gstreamer-0_10-plugins-base gstreamer-0_10-plugins-good gstreamer-0_10-plugins-bad gstreamer-0_10-plugins-ugly gstreamer-0_10-plugins-ffmpeg  gstreamer-plugins-bad-orig-addon
sudo zypper -n in -l packman gstreamer-plugins-bad gstreamer-plugins-bad-chromaprint gstreamer-plugins-bad-devel gstreamer-plugins-bad-fluidsynth gstreamer-plugins-bad-lang gstreamer-plugins-libav gstreamer-plugins-ugly gstreamer-plugins-ugly-lang
# kwplayer needs this repo
# wget  https://s1.music.126.net/download/pc/netease-cloud-music_1.0.0-2_amd64_ubuntu16.04.deb
# wget https://s1.music.126.net/dmusic/netease-cloud-music_1.1.0_amd64_ubuntu.deb
# ar p netease-cloud-music_*.deb data.tar.xz > netease-cloud-music_tmp.tar.xz
# sudo tar -xvf netease-cloud-music_tmp.tar.xz -C /
sudo zypper -n in -l netease-cloud-music
# 解决Firefox不能播放flash在线视频
sudo zypper -n in -l flash-player-ppapi
sudo zypper -n in -l aria2
sudo zypper -n in -l uget
if [ ! -f ./install_uget_integrator.sh ]; then
    wget https://raw.githubusercontent.com/ugetdm/uget-integrator/master/install/linux/install_uget_integrator.sh
fi
chmod +x install_uget_integrator.sh
./install_uget_integrator.sh
sudo zypper -n in -l git subversion mercurial
wget --no-check-certificate -q  https://raw.githubusercontent.com/petervanderdoes/gitflow-avh/develop/contrib/gitflow-installer.sh && sudo bash gitflow-installer.sh install stable; rm gitflow-installer.sh
sudo zypper -n in -l deluge
sudo zypper -n in -l transmission
sudo zypper -n in -l qbittorrent
sudo zypper -n in -l mldonkey
sudo zypper -n in -l axel
sudo zypper -n in -l htop
sudo zypper -n in -l google-chrome-stable
sudo zypper -n in -l chromium
# sudo zypper -n in -l midori
sudo zypper -n in -l packman:ffmpeg
# tomahawk use phonon-backend-vlc, so vlc-codecs ( in packman ) is needed.
# vlc-codecs 包含许多受限多媒体格式的解码器
sudo zypper -n in -l packman:vlc-codecs 
sudo zypper -n in -l packman:vlc 
sudo zypper -n in -l handbrake-cli
# sudo zypper -n in -l packman:MPlayer
# sudo zypper -n in -l packman:gmplayer
# sudo zypper -n in -l packman:smplayer
sudo zypper -n in -l  packman:obs-studio
# sudo zypper -n in -l audacious
# sudo zypper -n in -l clementine
# sudo zypper -n in -l rhythmbox
sudo zypper -n in -l cmus
sudo zypper -n in -l peek simplescreenrecorder
sudo zypper -n in -l zsh
sudo zypper -n in -l nodejs
sudo zypper -n in -l java-1_8_0-openjdk java-1_8_0-openjdk-devel java-1_8_0-openjdk-src
sudo zypper -n in -l java-11-openjdk java-11-openjdk-devel java-11-openjdk-src
sudo zypper -n in -l maven gradle tomcat
# sudo zypper -n in -l zookeeper-server
# sudo zypper -n in -l adoptopenjdk-8-hotspot adoptopenjdk-11-hotspot
sudo zypper -n in -l emacs emacs-el etags
sudo zypper -n in -l ctags
sudo zypper -n in -l the_silver_searcher
sudo zypper -n in -l ripgrep
sudo zypper -n in -l fd
sudo zypper -n in -l global
sudo pip install pygments
# 压缩，解压 rar 文件
sudo zypper -n in -l rar unrar
# 支持 7zip 压缩包
sudo zypper -n in -l p7zip
# 安装了该包后 ark 打开一些 windows 下创建的 zip 时不再乱码
# 这些 zip 包中的文件名实际上是以 GBK 编码的
sudo zypper -n in -l unzip-rcc
sudo zypper -n in -l gcc-c++ gcc gcc-devel
sudo zypper -n in -l cmake
sudo zypper -n in -l clang llvm llvm-devel clang-devel rtags
sudo zypper -n in -l tmux 
sudo zypper -n in -l vim
sudo zypper -n in -l neovim
sudo zypper -n in -l rdesktop
sudo zypper -n in -l fcitx fcitx-rime
#sudo zypper -n in -l ibus ibus-rime
# sudo zypper -n in -l xsel
sudo zypper -n in -l xclip
sudo zypper -n in -l aspell
sudo zypper -n in -l sbcl
sudo zypper -n in -l clisp
sudo zypper -n in -l osc rpmdevtools
sudo zypper -n in -l gcc kernel-source virtualbox virtualbox-qt
sudo zypper -n in -l -t pattern kvm_server kvm_tools
sudo zypper -n in -l docker docker-compose
sudo zypper -n in -l vagrant
sudo zypper -n in -l shadowsocks-libev
sudo zypper -n in -l proxychains
sudo zypper -n in -l privoxy
sudo zypper -n in -l filezilla
sudo zypper -n in -l xterm
sudo zypper -n in -l rxvt-unicode urxvt-font-size urxvt-perls
sudo zypper -n in -l mu4e
sudo zypper -n in -l mutt getmail msmtp procmail fetchmail
sudo zypper -n in -l MozillaThunderbird  
sudo zypper -n in -l code
# sudo zypper -n in -l sublime-text
sudo zypper -n in -l noto-serif-sc-fonts-full
sudo zypper -n in -l noto-sans-sc-fonts-full
# sudo zypper -n in -l noto-serif-tc-fonts-full noto-serif-jp-fonts-full noto-serif-kr-fonts-full
sudo zypper -n in -l hack-fonts
sudo zypper -n in -l fira-code-fonts
sudo zypper -n in -l wqy-bitmap-fonts
sudo zypper -n in -l wqy-microhei-fonts
sudo zypper -n in -l wqy-zenhei-fonts
#sudo zypper -n in -l adobe-sourcehanserif-fonts adobe-sourcehanserif-cn-fonts adobe-sourcehanserif-jp-fonts adobe-sourcehanserif-kr-fonts adobe-sourcehanserif-tw-fonts
#sudo zypper -n in -l adobe-sourcehansans-fonts adobe-sourcehansans-cn-fonts adobe-sourcehansans-jp-fonts adobe-sourcehansans-kr-fonts 
# sudo zypper -n in -l adobe-sourcehansans-tw-fonts
sudo zypper -n in -l postgresql postgresql-server postgresql-contrib postgresql-devel postgresql-server-devel
sudo zypper -n in -l mariadb mariadb-client libmariadb-devel
# sudo zypper -n in -l pgadmin3
sudo zypper -n in -l dropbox
#sudo zypper -n in -l patterns-opensuse-base patterns-opensuse-devel_basis
sudo zypper -n in -l scrot
sudo zypper -n in -l screenfetch
sudo zypper -n in -l keepassxc
sudo zypper -n in -l zeal
sudo zypper -n in -l rofi
sudo zypper -n in -l freemind
sudo zypper -n in -l freeplane
sudo zypper -n in -l vym
# sudo zypper -n in jiarenlu:bcloud
sudo zypper -n in -l libnotify-tools
sudo zypper -n in -l redis
#视频编辑
sudo zypper -n in -l  --no-recommends  kdenlive
sudo zypper -n in -l blender
#图片处理
sudo zypper -n in -l krita
sudo zypper -n in -l gnuplot
sudo zypper -n in -l bibletime
sudo zypper -n in -l syslog-ng syslog-service
sudo zypper -n in -l sysstat
sudo zypper -n in -l fish
sudo zypper -n in -l goldendict stardict
# sudo zypper -n in -l youdao-dict
sudo zypper -n in -l ledger
sudo zypper -n in -l shotcut
sudo zypper -n in -l direnv
sudo zypper -n in -l net-tools-deprecated
sudo zypper -n in -l remmina
sudo zypper -n in -l calibre
sudo zypper -n in -l inotify-tools
# centos lrzsz
sudo zypper -n in -l rzsz
# sudo zypper -n in -l calligra
sudo zypper -n in -l steam
sudo zypper -n in -l lutris
sudo zypper -n in -l exfat-utils
# sudo zypper -n in -l gnome-shell-extension-user-theme
# sudo zypper -n in -l gnome-calendar 
# sudo zypper -n in -l typelib-1_0-LunarDate-3_0
sudo zypper -n in -l xournalpp
# 禁用 leap 软件检查更新
#sudo zypper remove plasma5-pk-updates
#sudo zypper addlock plasma5-pk-updates
# sudo zypper -n in -l https://pencil.evolus.vn/dl/v3.0.4/pencil-3.0.4-49.x86_64.rpm
# sudo zypper -n in -l https://dbeaver.jkiss.org/files/4.1.2/dbeaver-ce-4.1.2-stable.x86_64.rpm
chsh -s /bin/zsh
#todo 将github管理的配置处理
export LANG=$OLD_LANG
