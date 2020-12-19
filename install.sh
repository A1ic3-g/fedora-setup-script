#!/bin/sh

#basic setup
echo "RUN AS ROOT"
dnf update
dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
echo "fastestmirror=1" >> /etc/dnf/dnf.conf

#chrome
dnf install fedora-workstation-repositories
dnf config-manager --set-enabled google-chrome

#vscode
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
sudo dnf check-update

dnf install git vlc code google-chrome-stable google-roboto-fonts la-capitaine-icon-theme breeze-cursor-theme gimp inkscape gnome-tweak-tool wget curl zsh util-linux-user redhat-rpm-config gcc gcc-c++ make fontawesome-fonts -y

#git config
git config --global user.name "MorphTail"
git config --global user.email "chitniskshitij@gmail.com"
git config --global credential.helper store

#zsh and stuff
git clone --depth=1 https://github.com/ryanoasis/nerd-fonts ~/.nerd-fonts
sudo bash ~/.nerd-fonts/install.sh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

echo "manual intervention (not yet automated): "
echo "1) change zsh theme (powerlevel10k/powerlevel10k) "
echo "2) add zsh plugins (zsh-syntax-highlighting zsh-autosuggestions) "
echo "3)download and set up gtk theme and fonts"
