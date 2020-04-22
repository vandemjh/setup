echo ===== Installing git =====
sudo apt install git
echo ===== Cloning repo =====
echo ".cfg" >> .gitignore
git clone --bare https://github.com/vandemjh/dotfiles.git $HOME/.cfg
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
config checkout
config config --local status.showUntrackedFiles no
rm .gitignore
