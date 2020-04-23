diff /etc/skel/.bash_logout ~/.bashrc
read -p "Warning! This script will delete your ~/.bashrc file, continue? " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    exit 1
fi
echo ===== Installing git =====
sudo apt-get -y install git
echo ===== Cloning repo =====
echo ".cfg" >> .gitignore
git clone --bare https://github.com/vandemjh/dotfiles.git $HOME/.cfg
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
config checkout
config config --local status.showUntrackedFiles no
rm .gitignore
