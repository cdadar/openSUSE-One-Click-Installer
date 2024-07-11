#!/bin/bash

# 修改语言为英语，确保命令的输出都是英语，这样对命令输出的处理就不会出错了
OLD_LANG=$LANG
export LANG=default
SCRIPT_DIR=$(dirname $0)

sudo zypper -n in -l lsb-release

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
sudo zypper --gpg-auto-import-keys ref
sudo zypper -n update -l
sudo zypper -n in -l git 
sudo zypper -n in -l htop
sudo zypper -n in -l google-chrome-stable
sudo zypper -n in -l zsh
sudo zypper -n in -l mlocate
sudo zypper -n in -l nodejs npm
# sudo zypper -n in -l nodejs12 npm12
# sudo zypper -n in -l nodejs14 npm14
# sudo zypper -n in -l nodejs16 npm16
# sudo zypper -n in -l java-1_8_0-openjdk java-1_8_0-openjdk-devel java-1_8_0-openjdk-src
# sudo zypper -n in -l java-11-openjdk java-11-openjdk-devel java-11-openjdk-src  java-11-openjdk-jmods
# sudo zypper -n in -l java-17-openjdk java-17-openjdk-devel java-17-openjdk-src  java-17-openjdk-jmods
# sudo zypper -n in -l maven gradle tomcat
sudo zypper -n in -l emacs emacs-el etags
sudo zypper -n in -l ctags
sudo zypper -n in -l the_silver_searcher
sudo zypper -n in -l ripgrep
sudo zypper -n in -l fzf
sudo zypper -n in -l fd
# 压缩，解压 rar 文件
sudo zypper -n in -l rar unrar
# 支持 7zip 压缩包
sudo zypper -n in -l p7zip
sudo zypper -n in -l zip unzip
# 安装了该包后 ark 打开一些 windows 下创建的 zip 时不再乱码
# 这些 zip 包中的文件名实际上是以 GBK 编码的
sudo zypper -n in -l unzip-rcc
sudo zypper -n in -l tmux 
sudo zypper -n in -l vim
sudo zypper -n in -l neovim
# sudo zypper -n in -l fcitx5 fcitx5-rime
sudo zypper -n in -l ibus ibus-rime
sudo zypper -n in -l xsel
sudo zypper -n in -l xclip
sudo zypper -n in -l wl-clipboard
sudo zypper -n in -l aspell
sudo zypper -n in -l docker docker-compose
sudo zypper -n in -l proxychains
sudo zypper -n in -l privoxy
sudo zypper -n in -l filezilla
sudo zypper -n in -l xterm
sudo zypper -n in -l rxvt-unicode urxvt-font-size urxvt-perls
sudo zypper -n in -l code
sudo zypper -n in -l sublime-text
sudo zypper -n in -l noto-serif-sc-fonts-full
sudo zypper -n in -l noto-sans-sc-fonts-full
sudo zypper -n in -l source-han-sans-cn-fonts
sudo zypper -n in -l source-han-serif-cn-fonts
sudo zypper -n in -l hack-fonts
sudo zypper -n in -l fira-code-fonts
sudo zypper -n in -l wqy-bitmap-fonts
sudo zypper -n in -l wqy-microhei-fonts
sudo zypper -n in -l wqy-zenhei-fonts
sudo zypper -n in -l saja-cascadia-code-fonts
sudo zypper -n in -l sarasa-gothic-fonts
sudo zypper -n in -l dropbox
sudo zypper -n in -l keepassxc
sudo zypper -n in -l zeal
sudo zypper -n in -l libnotify-tools
sudo zypper -n in -l direnv
sudo zypper -n in -l net-tools-deprecated
sudo zypper -n in -l remmina
sudo zypper -n in -l inotify-tools
sudo zypper -n in -l libnotify-tools
sudo zypper -n in -l xchm
# centos lrzsz
sudo zypper -n in -l rzsz
sudo zypper -n in -l stow
# 禁用 leap 软件检查更新
chsh -s /bin/zsh
#todo 将 github 管理的配置处理
export LANG=$OLD_LANG
