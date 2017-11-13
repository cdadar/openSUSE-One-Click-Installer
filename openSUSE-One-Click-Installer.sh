#!/bin/bash

# 修改语言为英语，确保命令的输出都是英语，这样对命令输出的处理就不会出错了
OLD_LANG=$LANG
export LANG=default
SCRIPT_DIR=$(dirname $0)

if [ ! -f $SCRIPT_DIR/README.md ]; then
  wget -nd -c -P $SCRIPT_DIR --no-check-certificate --no-cookies  "https://raw.githubusercontent.com/redhatlinux10/openSUSE-One-Click-Installer/master/README.md"
fi
if [ ! -f $SCRIPT_DIR/ooci.conf ]; then
  wget -nd -c -P $SCRIPT_DIR --no-check-certificate --no-cookies  "https://raw.githubusercontent.com/redhatlinux10/openSUSE-One-Click-Installer/master/ooci.conf"
fi

cat "$SCRIPT_DIR/README.md"
read -p "你确定继续吗？ (Y|n) : " confirm_continue

if [ -z "$confirm_continue" ]; then
  confirm_continue="Y"
fi
if [ "$confirm_continue" == "n" -o "$confirm_continue" == "no" ]; then
  exit
fi

. $SCRIPT_DIR/ooci.conf

OSVER=$(lsb_release -r|awk '{print $2}')
ARCH=$(uname -m)

TMP_DIR=`mktemp -d`

# 禁用 cd 源
if [ "$disable_cd_repo" != "0" ]; then
  CD_REPO_ID=`zypper lr -u | awk -F'[|+]'  '$6 ~ /^\s*cd:\/\// {print $1}'`

  if [ -n "$CD_REPO_ID" ]; then
      sudo zypper mr -d $CD_REPO_ID
  fi
fi

# 添加软件源
# w32codec-all 需要该源
sudo zypper --gpg-auto-import-keys ar -c  http://packman.inode.at/suse/openSUSE_Leap_$OSVER/ packman

sudo zypper --gpg-auto-import-keys ar -c http://download.opensuse.org/repositories/home:/opensuse_zh/openSUSE_Leap_$OSVER/ opensusu_zh
# sudo zypper --gpg-auto-import-keys ar http://repo.fdzh.org/chrome/ google-chrome-stable

sudo zypper --gpg-auto-import-keys ar -c  http://dl.google.com/linux/chrome/rpm/stable/$(uname -m) google-chrome

sudo zypper --gpg-auto-import-keys ar -c http://download.opensuse.org/repositories/editors/openSUSE_Leap_$OSVER/ editors 

sudo zypper --gpg-auto-import-keys ar -c http://download.opensuse.org/repositories/M17N:/fonts/openSUSE_Leap_$OSVER/  M17N:fonts

sudo zypper --gpg-auto-import-keys ar -c http://download.opensuse.org/repositories/devel:/languages:/nodejs/openSUSE_Leap_$OSVER/ nodejs

sudo zypper --gpg-auto-import-keys ar -c http://download.opensuse.org/repositories/devel:/tools/openSUSE_Leap_$OSVER/ devel:tools

# sudo zypper --gpg-auto-import-keys ar -c http://download.opensuse.org/repositories/server:/mail/openSUSE_Leap_$OSVER/ mail

sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ntype=rpm-md\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/zypp/repos.d/vscode.repo'

# 刷新软件源并更新系统
sudo zypper --gpg-auto-import-keys ref

sudo zypper -n update -l

sudo zypper -n in -l aria2

sudo zypper -n in -l deluge

sudo zypper -n in -l uget

sudo zypper -n in -l mldonkey

# 安装 gstreamer 相关插件，这样基于 phonon 框架的多媒体软件就可以播放受专利保护的多媒体文件了
if [ "$install_gstreamer_plugins" != "0" ]; then
  sudo zypper -n in -l gstreamer-0_10-plugins-base gstreamer-0_10-plugins-good gstreamer-0_10-plugins-bad gstreamer-0_10-plugins-ugly gstreamer-0_10-plugins-ffmpeg  gstreamer-plugins-bad-orig-addon
fi

if [ "$install_netease_cloud_music" != "0" ]; then
    # kwplayer needs this repo
    wget  http://s1.music.126.net/download/pc/netease-cloud-music_1.0.0-2_amd64_ubuntu16.04.deb

    ar p netease-cloud-music_*.deb data.tar.xz > netease-cloud-music_tmp.tar.xz
    sudo tar -xvf netease-cloud-music_tmp.tar.xz -C /

  # opensuse-zh 源中的脚本不能很好的安装
    sudo zypper -n in -l netease-cloud-music
  
fi

# 解决Firefox不能播放flash在线视频
if [ "$install_flash_player" != "0" ]; then
    sudo zypper -n in -l flash-player-ppapi
fi

sudo zypper -n in -l google-chrome-stable

sudo zypper -n in -l  packman:ffmpeg 

# tomahawk use phonon-backend-vlc, so vlc-codecs ( in packman ) is needed.
sudo zypper -n in -l packman:vlc-codecs

  # vlc-codecs 包含许多受限多媒体格式的解码器
sudo zypper -n in -l packman:vlc packman:xvba-video

sudo zypper -n in -l packman:MPlayer

sudo zypper -n in -l nodejs:nodejs6

sudo zypper -n in -l editors:emacs editors:emacs-el

sudo zypper -n in -l etags

sudo zypper -n in -l ctags

sudo zypper -n in -l global

sudo zypper -n in -l git

# 压缩，解压 rar 文件
sudo zypper -n in -l rar unrar

# 支持 7zip 压缩包
sudo zypper -n in -l p7zip

# 安装了该包后 ark 打开一些 windows 下创建的 zip 时不再乱码
# 这些 zip 包中的文件名实际上是以 GBK 编码的
sudo zypper -n in -l unzip-rcc

sudo zypper -n in -l gcc-c++ gcc

sudo zypper -n in -l clang llvm-devel

sudo zypper -n in -l tmux vim

sudo zypper -n in -l rdesktop

sudo zypper -n in -l steam

sudo zypper -n in -l fcitx fcitx-rime

# sudo zypper -n in -l xsel

sudo zypper -n in -l xclip

sudo zypper -n in -l  aspell

sudo zypper -n in -l sbcl

sudo zypper -n in -l osc rpmdevtools

sudo zypper -n in -l the_silver_searcher

sudo zypper -n in -l gcc kernel-source virtualbox virtualbox-qt

sudo zypper -n in -l docker docker-compose 

sudo zypper -n in -l shadowsocks-libev

sudo zypper -n in -l proxychains

sudo zypper -n in -l privoxy

sudo zypper -n in -l filezilla

sudo zypper -n in -l xterm

sudo zypper -n in -l mutt getmail msmtp procmail

sudo zypper -n in -l code

sudo zypper -n in -l noto-serif-sc-fonts-full

# sudo zypper -n in -l noto-serif-tc-fonts-full noto-serif-jp-fonts-full noto-serif-kr-fonts-full

sudo zypper -n in -l postgresql postgresql-server postgresql-contrib postgresql-devel

sudo zypper -n in -l pgadmin3

sudo zypper -n in -l dropbox

sudo zypper -n in -l patterns-openSUSE-base patterns-openSUSE-devel_basis

sudo zypper -n in -l texlive texlive-latex  texlive-xetex texlive-ctex

sudo zypper -n in -l texlive-cjkpunct texlive-wrapfig texlive-capt-of 

sudo zypper -n in -l scrot

sudo zypper -n in -l screenfetch

sudo zypper -n in -l keepass

sudo zypper -n in -l zeal

sudo npm install -g webpack

sudo npm install -g tern 

sudo npm install -g gitbook-cli

sudo npm install -g yarn

# sudo zypper -n in -l http://pencil.evolus.vn/dl/V3.0.4/Pencil-3.0.4-49.x86_64.rpm
# sudo zypper -n in -l http://dbeaver.jkiss.org/files/4.1.2/dbeaver-ce-4.1.2-stable.x86_64.rpm

if [ "$translate_user_dirs_names_from_chinese_to_english" != "0" ]; then
  export LANG=default
  xdg-user-dirs-update --force
  cd ~/桌面/ && ls -A | xargs -i mv -f {} ~/Desktop/ && rmdir ~/桌面
  cd ~/下载/ && ls -A | xargs -i mv -f {} ~/Downloads/ && rmdir ~/下载
  cd ~/模板/ && ls -A | xargs -i mv -f {} ~/Templates/ && rmdir ~/模板
  cd ~/公共/ && ls -A | xargs -i mv -f {} ~/Public/ && rmdir ~/公共
  cd ~/文档/ && ls -A | xargs -i mv -f {} ~/Documents/ && rmdir ~/文档
  cd ~/音乐/ && ls -A | xargs -i mv -f {} ~/Music/ && rmdir ~/音乐
  cd ~/图片/ && ls -A | xargs -i mv -f {} ~/Pictures/ && rmdir ~/图片
  cd ~/视频/ && ls -A | xargs -i mv -f {} ~/Videos/ && rmdir ~/视频
fi


#TODO 将github管理的配置处理
