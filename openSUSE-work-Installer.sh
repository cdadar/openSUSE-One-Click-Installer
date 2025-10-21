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
zypper -n update -l
zypper -n in -l git git-lfs
zypper -n in -l htop
zypper -n in -l google-chrome-stable
zypper -n in -l zsh
zypper -n in -l mlocate
zypper -n in -l nodejs npm
# zypper -n in -l nodejs12 npm12
# zypper -n in -l nodejs14 npm14
# zypper -n in -l nodejs16 npm16
# zypper -n in -l java-1_8_0-openjdk java-1_8_0-openjdk-devel java-1_8_0-openjdk-src
# zypper -n in -l java-11-openjdk java-11-openjdk-devel java-11-openjdk-src  java-11-openjdk-jmods
# zypper -n in -l java-17-openjdk java-17-openjdk-devel java-17-openjdk-src  java-17-openjdk-jmods
# zypper -n in -l maven gradle tomcat
zypper -n in -l emacs emacs-el etags
zypper -n in -l tree-sitter
zypper -n in -l tree-sitter-python
zypper -n in -l tree-sitter-java
zypper -n in -l tree-sitter-javascript
zypper -n in -l tree-sitter-bash
zypper -n in -l tree-sitter-css
zypper -n in -l tree-sitter-go
zypper -n in -l tree-sitter-html
zypper -n in -l tree-sitter-json
zypper -n in -l tree-sitter-markdown
zypper -n in -l tree-sitter-typescript
zypper -n in -l tree-sitter-xml
zypper -n in -l tree-sitter-devel
zypper -n in -l ctags
zypper -n in -l the_silver_searcher
zypper -n in -l ripgrep
zypper -n in -l fzf
zypper -n in -l fd
# 压缩，解压 rar 文件
zypper -n in -l rar unrar
# 支持 7zip 压缩包
zypper -n in -l p7zip
zypper -n in -l zip unzip
# 安装了该包后 ark 打开一些 windows 下创建的 zip 时不再乱码
# 这些 zip 包中的文件名实际上是以 GBK 编码的
zypper -n in -l unzip-rcc
zypper -n in -l tmux 
zypper -n in -l vim
zypper -n in -l neovim
zypper -n in -l fcitx5 fcitx5-rime
# zypper -n in -l ibus ibus-rime
zypper -n in -l xsel
zypper -n in -l xclip
zypper -n in -l wl-clipboard
zypper -n in -l aspell
zypper -n in -l docker docker-compose
zypper -n in -l proxychains
zypper -n in -l privoxy
zypper -n in -l filezilla
zypper -n in -l xterm
zypper -n in -l rxvt-unicode urxvt-font-size urxvt-perls
zypper -n in -l code
zypper -n in -l sublime-text
zypper -n in -l noto-serif-sc-fonts-full
zypper -n in -l google-noto-sans-cjk-fonts
zypper -n in -l noto-sans-sc-fonts-full
zypper -n in -l source-han-sans-cn-fonts
zypper -n in -l source-han-serif-cn-fonts
zypper -n in -l hack-fonts
zypper -n in -l fira-code-fonts
zypper -n in -l wqy-bitmap-fonts
zypper -n in -l wqy-microhei-fonts
zypper -n in -l wqy-zenhei-fonts
zypper -n in -l saja-cascadia-code-fonts
zypper -n in -l sarasa-gothic-fonts
# zypper -n in -l dropbox
zypper -n in -l keepassxc
zypper -n in -l zeal
zypper -n in -l libnotify-tools
zypper -n in -l direnv
zypper -n in -l net-tools-deprecated
zypper -n in -l remmina
zypper -n in -l inotify-tools
zypper -n in -l libnotify-tools
zypper -n in -l xchm
# centos lrzsz
zypper -n in -l rzsz
zypper -n in -l stow
zypper -n in -l wireshark
zypper -n in -l libgthread-2_0-0
# 禁用 leap 软件检查更新
chsh -s /bin/zsh
#todo 将 github 管理的配置处理
export LANG=$OLD_LANG
