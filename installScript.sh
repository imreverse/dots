#!/bin/bash

# TODO: Add error handling, like if a command fails, stop the script
# 6. Install all the pacman and yay applications
# 8. stow all directories
# 9. Configure bluetooth
# >. Reboot
# Things remaining: Config for GUIs, Widgets, Icons, Themes, Sys Settings

# Update pacman.conf ####################################################################
sed -i \
    -e "s/.*CheckSpace/CheckSpace/" \
    -e "s/.*Color/Color/" \
    -e "s/.*ParallelDownloads/ParallelDownloads/" \
    -e "s/.*VerbosePkgLists/VerbosePkgLists/" \
    -e "s/.*ILoveCandy/#ILoveCandy/" \
    ./pacman.conf

checkAndAdd () {
    if ! grep -q $1 "./pacman.conf"; then
        sed -i "/# Misc options/a $1" ./pacman.conf
    fi
}
checkAndAdd "CheckSpace"
checkAndAdd "Color"
checkAndAdd "ParallelDownloads"
checkAndAdd "VerbosePkgLists"

# Update mirrorlist #####################################################################
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
reflector --verbose \
    -c AU -c DK -c DE -c IN -c IT -c NL -c NZ -c ES -c CH -c GB -c US \
    --protocol https \
    --sort rate \
    --latest 25 \
    --download-timeout 5 \
    --save /etc/pacman.d/mirrorlist

# Full upgrade ##########################################################################
# Maybe remove the following yes?
yes | pacman -Syyu

# Mount and symlink #####################################################################
userName=$(who | awk '{print $1}')
makeAndMount () {
    mkdir /run/media/$userName/$2
    mount /dev/$1 /run/media/$userName/$2
}
makeAndMount 'sda4' 'win10'
makeAndMount 'sda6' 'pdisk'
makeAndMount 'sda9' 'data'
rm ~/{Documents,Downloads,Music,Pictures,Videos} -r
ln -s /run/media/$userName/data/Documents ~/Documents
ln -s /run/media/$userName/data/Downloads ~Downloads/
ln -s /run/media/$userName/data/Music ~/Music
ln -s /run/media/$userName/data/Pictures ~/Pictures
ln -s /run/media/$userName/data/Videos ~/Videos

win10=$(sudo blkid | grep sda4 | grep -oP '(?<= UUID\=")[^"]*')
pdisk=$(sudo blkid | grep sda6 | grep -oP '(?<= UUID\=")[^"]*')
data=$(sudo blkid | grep sda9 | grep -oP '(?<= UUID\=")[^"]*')
# TODO: Look into what the diff flags mean, like umask, gid, etc
echo "\
UUID=${win10}                     /run/media/${userName}/win10  ntfs    rw,auto,users,exec,nls=utf8,umask=003,gid=46,uid=1000   0       0
UUID=${pdisk}                     /run/media/${userName}/pdisk  ntfs    rw,auto,users,exec,nls=utf8,umask=003,gid=46,uid=1000   0       0
UUID=${data} /run/media/${userName}/data   ext4    defaults,noatime                                        0       0
" >> /etc/fstab

# Install applications ##################################################################
# Maybe remove the following yes?
yes | pacman -S .....
# essential
android-tools bat btop chromium dolphin-plugins exa ffmpegthumbs flameshot imagemagick inter-font\
    kdialog kdiskmark kio-gdrive kitty ksysguard (for netspeed widget) kvantum-qt5 libreoffice-fresh mediainfo-gui\
    mkvtoolnix-gui mpv neovim plasma-wayland-session qbittorrent qt5-imageformats rclone ripgrep\
    simplescreenrecorder speedcrunch stow tmux unrar vlc vnote xcftools xclip/wl-clipboard yt-dlp zsh
# Not necessary
bash-language-server ccls clamav clamtk discord entr gimp grub grub-customizer jdk-openjdk kcharselect keepassxc kolourpaint lm_sensors lua-language-server

# Change shell ##########################################################################
chsh -s $(which zsh)

# Compile bits/stdc++.h #################################################################
cd ~/Documents/satan/bits/
rm ./stdc++.h.gch
# TODO: Change latest
cp /usr/include/c++/{latest}/x86_64-pc-linux-gnu/bits/stdc++.h ./
g++ -std=c++20 stdc++.h -fsanitize=address,undefined -Wshadow -Wall -Wfatal-errors

# Stow ##################################################################################
git clone https://github.com/imreverse/dots.git ~
# echo "Stowing Dotfiles...";
# for file in ./*; do
#     echo ${file};
# done
# echo "Stowing Done.";
