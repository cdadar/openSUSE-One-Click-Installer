#!/bin/bash

# 修改语言为英语，确保命令的输出都是英语，这样对命令输出的处理就不会出错了
OLD_LANG=$LANG
export LANG=default
SCRIPT_DIR=$(dirname $0)

zypper -n in -l lsb-release

is_leap=$(echo $(lsb-release -d) |grep 'Leap')
if [[ "$is_leap" != "" ]]
then
    # leap 的软件源
    . $SCRIPT_DIR/leap-repositories.sh 
else
    # tw 的软件源
    . $SCRIPT_DIR/tumbleweed-repositories.sh 
fi

# 刷新软件源并更新系统
zypper --gpg-auto-import-keys ref
zypper update -l
zypper in -l google-chrome-stable
# zypper al libqt5-qtbase-platformtheme-gtk3 libqt5-qtstyleplugins-platformtheme-gtk2
# 安装 gstreamer 相关插件，这样基于 phonon 框架的多媒体软件就可以播放受专利保护的多媒体文件了
zypper -n in -l gstreamer-0_10-plugins-base gstreamer-0_10-plugins-good gstreamer-0_10-plugins-bad gstreamer-0_10-plugins-ugly gstreamer-0_10-plugins-ffmpeg  gstreamer-plugins-bad-orig-addon
zypper -n in -l gstreamer-plugins-bad gstreamer-plugins-bad-chromaprint gstreamer-plugins-bad-devel gstreamer-plugins-bad-fluidsynth gstreamer-plugins-bad-lang gstreamer-plugins-libav gstreamer-plugins-ugly gstreamer-plugins-ugly-lang
# kwplayer needs this repo
# wget  https://s1.music.126.net/download/pc/netease-cloud-music_1.0.0-2_amd64_ubuntu16.04.deb
# wget https://s1.music.126.net/dmusic/netease-cloud-music_1.1.0_amd64_ubuntu.deb
# ar p netease-cloud-music_*.deb data.tar.xz > netease-cloud-music_tmp.tar.xz
# tar -xvf netease-cloud-music_tmp.tar.xz -C /
zypper -n in -l netease-cloud-music
# 解决 Firefox 不能播放 flash 在线视频
# zypper -n in -l flash-player
#zypper -n in -l aria2
#zypper -n in -l uget
# if [ ! -f ./install_uget_integrator.sh ]; then
#     wget https://raw.githubusercontent.com/ugetdm/uget-integrator/master/install/linux/install_uget_integrator.sh
#     chmod +x install_uget_integrator.sh
#     ./install_uget_integrator.sh
# fi
zypper -n in -l git git-lfs subversion mercurial
#wget -o-check-certificate -q  https://raw.githubusercontent.com/petervanderdoes/gitflow-avh/develop/contrib/gitflow-installer.sh && bash gitflow-installer.sh install stable; rm gitflow-installer.sh
#zypper -n in -l deluge
# zypper -n in -l transmission
#zypper -n in -l qbittorrent
#zypper -n in -l mldonkey
#zypper -n in -l aMule
#zypper -n in -l axel
zypper -n in -l htop

#zypper -n in -l chromium
#zypper -n in -l midori
zypper -n in -l packman:ffmpeg
# tomahawk use phonon-backend-vlc, so vlc-codecs ( in packman ) is needed.
# vlc-codecs 包含许多受限多媒体格式的解码器
zypper -n in -l packman:vlc-codecs 
zypper -n in -l packman:vlc 
zypper -n in -l handbrake-cli
zypper -n in -l mpv
zypper -n in -l kodi
# zypper -n in -l packman:MPlayer
# zypper -n in -l packman:gmplayer
# zypper -n in -l packman:smplayer
#zypper -n in -l  packman:obs-studio
# zypper -n in -l audacious
# zypper -n in -l clementine
# zypper -n in -l rhythmbox
zypper -n in -l cmus
# zypper -n in -l peek simplescreenrecorder
zypper -n in -l zsh
zypper -n in -l mlocate
zypper -n in -l nodejs
# zypper -n in -l nodejs12 npm12
# zypper -n in -l nodejs14 npm14
# zypper -n in -l nodejs16 npm16
# zypper -n in -l java-1_8_0-openjdk java-1_8_0-openjdk-devel java-1_8_0-openjdk-src
# zypper -n in -l java-11-openjdk java-11-openjdk-devel java-11-openjdk-src  java-11-openjdk-jmods
# zypper -n in -l java-17-openjdk java-17-openjdk-devel java-17-openjdk-src  java-17-openjdk-jmods
zypper -n in -l java-21-openjdk java-21-openjdk-devel java-21-openjdk-src  java-21-openjdk-jmods
# zypper -n in -l maven gradle tomcat
# zypper -n in -l zookeeper-server
# zypper -n in -l adoptopenjdk-8-hotspot adoptopenjdk-11-hotspot
zypper -n in -l emacs emacs-el etags
zypper -n in -l tree-sitter
zypper -n in -l tree-sitter-python
zypper -n in -l tree-sitter-java
zypper -n in -l tree-sitter-javascript
zypper -n in -l tree-sitter-bash
zypper -n in -l tree-sitter-c
zypper -n in -l tree-sitter-c-sharp
zypper -n in -l tree-sitter-cpp
zypper -n in -l tree-sitter-css
zypper -n in -l tree-sitter-go
zypper -n in -l tree-sitter-haskell
zypper -n in -l tree-sitter-html
zypper -n in -l tree-sitter-json
zypper -n in -l tree-sitter-lua
zypper -n in -l tree-sitter-markdown
zypper -n in -l tree-sitter-qmldir
zypper -n in -l tree-sitter-qmljs
zypper -n in -l tree-sitter-query
zypper -n in -l tree-sitter-regex
zypper -n in -l tree-sitter-ruby
zypper -n in -l tree-sitter-rust
zypper -n in -l tree-sitter-typescript
zypper -n in -l tree-sitter-vim
zypper -n in -l tree-sitter-vimdoc
zypper -n in -l tree-sitter-xml
zypper -n in -l tree-sitter-devel
zypper -n in -l tree-sitter-zig
#zypper  si emacs
zypper -n in -l ctags
zypper -n in -l the_silver_searcher
zypper -n in -l ripgrep
zypper -n in -l fzf
zypper -n in -l fd
# zypper -n in -l global
# pip install pygments
# 压缩，解压 rar 文件
zypper -n in -l rar unrar
# 支持 7zip 压缩包
zypper -n in -l 7zip
zypper -n in -l zip unzip
# 安装了该包后 ark 打开一些 windows 下创建的 zip 时不再乱码
# 这些 zip 包中的文件名实际上是以 GBK 编码的
zypper -n in -l unzip-rcc
zypper -n in -l gcc-c++ gcc
zypper -n in -l cmake
zypper -n in -l clang llvm llvm-devel clang-devel rtags
zypper -n in -l tmux
zypper -n in -l vim
zypper -n in -l neovim
zypper -n in -l rdesktop
zypper -n in -l fcitx5 fcitx5-rime
# zypper -n in -l ibus ibus-rime
zypper -n in -l xsel
zypper -n in -l xclip
zypper -n in -l wl-clipborad
zypper -n in -l aspell
zypper -n in -l sbcl
zypper -n in -l tailscale
#zypper -n in -l clisp
# zypper -n in -l osc rpmdevtools
zypper -n in -l gcc kernel-source virtualbox virtualbox-qt
zypper -n in -l -t pattern kvm_server kvm_tools
zypper -n in -l docker docker-compose
# zypper -n in -l vagrant
# zypper -n in -l shadowsocks-libev
zypper -n in -l proxychains
zypper -n in -l privoxy
zypper -n in -l filezilla
zypper -n in -l xterm
zypper -n in -l rxvt-unicode urxvt-font-size urxvt-perls
# zypper -n in -l mu4e
# zypper -n in -l mutt getmail msmtp procmail fetchmail
# zypper -n in -l MozillaThunderbird  
zypper -n in -l code
zypper -n in -l sublime-text
zypper -n in -l google-noto-sans-cjk-fonts
zypper -n in -l noto-serif-sc-fonts-full
zypper -n in -l noto-sans-sc-fonts-full
zypper -n in -l source-han-sans-cn-fonts
zypper -n in -l source-han-serif-cn-fonts
# zypper -n in -l noto-serif-tc-fonts-full noto-serif-jp-fonts-full noto-serif-kr-fonts-full
zypper -n in -l hack-fonts
zypper -n in -l fira-code-fonts
zypper -n in -l wqy-bitmap-fonts
zypper -n in -l wqy-microhei-fonts
zypper -n in -l wqy-zenhei-fonts
zypper -n in -l saja-cascadia-code-fonts
zypper -n in -l sarasa-gothic-fonts
zypper -n in -l lxgw-wenkai-fonts
#zypper -n in -l adobe-sourcehanserif-fonts adobe-sourcehanserif-cn-fonts adobe-sourcehanserif-jp-fonts adobe-sourcehanserif-kr-fonts adobe-sourcehanserif-tw-fonts
#zypper -n in -l adobe-sourcehansans-fonts adobe-sourcehansans-cn-fonts adobe-sourcehansans-jp-fonts adobe-sourcehansans-kr-fonts 
# zypper -n in -l adobe-sourcehansans-tw-fonts
zypper -n in -l postgresql postgresql-server postgresql-contrib postgresql-devel postgresql-server-devel
zypper -n in -l mariadb mariadb-client libmariadb-devel
# zypper -n in -l pgadmin3
# zypper -n in -l dolphin-plugins
zypper -n in -l dropbox
# zypper -n in -l patterns-opensuse-base patterns-opensuse-devel_basis
zypper -n in -l scrot
zypper -n in -l shotcut
zypper -n in -l screenfetch
zypper -n in -l keepassxc
zypper -n in -l zeal
# zypper -n in -l rofi
# zypper -n in -l freemind
# zypper -n in -l freeplane
# zypper -n in -l vym
# zypper  in jiarenlu:bcloud
zypper -n in -l redis
#视频编辑
zypper -n in -l  -o-recommends kdenlive
# zypper -n in -l blender
zypper -n in -l audacity
#图片处理
zypper -n in -l krita
zypper -n in -l gnuplot
zypper -n in -l bibletime
zypper -n in -l xiphos
# zypper -n in -l syslogg syslog-service
zypper -n in -l sysstat
#zypper -n in -l fish
#zypper -n in -l goldendict stardict
# zypper -n in -l youdao-dict
zypper -n in -l ledger
zypper -n in -l direnv
zypper -n in -l net-tools-deprecated
zypper -n in -l remmina
zypper -n in -l calibre
zypper -n in -l inotify-tools
zypper -n in -l libnotify-tools
zypper -n in -l xchm
# centos lrzsz
zypper -n in -l rzsz
# zypper -n in -l calligra
zypper -n in -l steam
zypper -n in -l lutris
# zypper -n in -l gnome-shell-extension-user-theme
# zypper -n in -l gnome-calendar 
# zypper -n in -l typelib-1_0-LunarDate-3_0
zypper -n in -l xournalpp
zypper -n in -l stow
zypper -n in -l tesseract-ocr tesseract-ocr-traineddata-chi_sim
zypper -n in -l wireshark
zypper -n in -l libgthread-2_0-0
#zypper -n in -l kio-gdrive
# 禁用 leap 软件检查更新
#zypper remove plasma5-pk-updates
#zypper addlock plasma5-pk-updates
# zypper -n in -l https://pencil.evolus.vn/dl/v3.0.4/pencil-3.0.4-49.x86_64.rpm
# zypper -n in -l https://dbeaver.jkiss.org/files/4.1.2/dbeaver-ce-4.1.2-stable.x86_64.rpm
chsh -s /bin/zsh
#todo 将 github 管理的配置处理
export LANG=$OLD_LANG
