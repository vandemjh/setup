cd
if [ "$(diff /etc/skel/.bashrc ~/.bashrc)" != "" ] 
then
    read -p "Warning! This script will delete your ~/.bashrc file, continue? (y/n) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]
    then
        exit 1
    fi
fi

apt update
apt upgrade
echo ===== Installing sudo =====
apt install sudo
echo ===== Installing curl =====
sudo apt install curl
echo ===== Installing git =====
sudo apt-get -y install git
echo ===== Cloning repo =====
echo ".cfg" >> .gitignore
git clone --bare https://github.com/vandemjh/dotfiles.git $HOME/.cfg
shopt -s expand_aliases     #Allows aliases in current shell scope
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
echo ===== Removing old .bashrc =====
rm .bashrc
echo ===== Importing dotfiles =====
config checkout
config config --local status.showUntrackedFiles no
rm .gitignore
echo ===== Continuing... =====
chmod +x .setup
./.setup

# === Setup Instructions for Mac ===
# 1) Install homebrew
# 2) Install

# To add later...
# | whiptail --title "Jack's Linux Suite Installer" --gauge "${phases[0]}" 6 60 0
# --backtitle "$(printf 'Jack! %.0s' {1..500})" 
