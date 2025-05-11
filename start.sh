# run script as root
if [ "$EUID" -ne 0 ]; then
    echo "SUDO YOU IDIOT"
    exit
fi

installs="git curl wget vim tmux zsh neovim"
if [ -f /usr/bin/apt ]; then
    sudo apt install $installs
elif [ -f /usr/bin/dnf ]; then
    sudo dnf install $installs
elif [ -f /usr/bin/yum ]; then
    sudo yum install $installs
elif [ -f /usr/bin/pacman ]; then
    sudo pacman -S $installs
elif [ -f /usr/bin/brew ]; then
    brew install $installs
elif [ -f /usr/bin/port ]; then
    sudo port install $installs
elif [ -f /usr/bin/zypper ]; then
    sudo zypper install $installs
elif [ -f /usr/bin/xbps-install ]; then
    sudo xbps-install -S $installs
elif [ -f /usr/bin/apk ]; then
    sudo apk add $installs
elif [ -f /usr/bin/flatpak ]; then
    flatpak install $installs
elif [ -f /usr/bin/snap ]; then
    sudo snap install $installs
else
    echo "No package manager found"
fi

git clone git@github.com:christoomey/vim-tmux-navigator.git ~/.vim/pack/plugins/start/vim-tmux-navigator

cp -r nvim ~/.config/nvim
cp -r .tmux.conf ~/.tmux.conf

echo "Open tmux and press <C-a> + i to install plugins"

echo "Open tmux and press <C-a> + i to install plugins"


