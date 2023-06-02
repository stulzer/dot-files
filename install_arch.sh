ECHO 'Installing dependencies'
sudo pacman -S --needed base-devel
sudo pacman -Sy git nodejs tmux neovim python fzf powerline powerline-fonts python-pip bash-completion

ECHO 'Installing yay'
cd ~
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ~

ECHO 'Installing dependencies with yay'
yay -Sy tmux-bash-completion-git asdf-vm nerd-fonts-inconsolata ripgrep-all 

ECHO 'Installing nodejs'
asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf install nodejs 14.15.2
asdf global nodejs 14.15.2

ECHO 'Installing ruby'
asdf plugin-add ruby https://github.com/asdf-vm/asdf-ruby.git
asdf install ruby 3.0.1
asdf global ruby 3.0.1

ECHO 'Installing Heroku Toolbelt'
yay -Sy heroku-cli

ECHO 'Installing vim-plug'
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

ECHO 'Installing neovim packages'
gem install neovim
pip install neovim
npm install -g neovim

ECHO 'Cloning dot files'
git clone https://github.com/stulzer/dot-files ~/.etc/

ECHO 'Creating and symlinking configurations'
cd ~
mkdir .ssh .secrets .config .config/nvim .etc/env/
touch ~/.secrets/vars

ln -s ~/.secrets/vars ~/.etc/env/vars
ln -s ~/.etc/nvim/init.vim ~/.config/nvim/init.vim
ln -s ~/.etc/bash_profile .bash_profile
ln -s ~/.etc/bashrc .bashrc
ln -s ~/.etc/gemrc .gemrc
ln -s ~/.etc/gitignore .gitignore
ln -s ~/.etc/gitk .gitk
ln -s ~/.etc/rspec .rspec
ln -s ~/.etc/tmux.conf .tmux.conf
ln -s ~/.etc/ssh/config .ssh/config
ln -s ~/.etc/.tool-versions .tool-versions
ln -s ~/.etc/.asdfrc .asdfrc
ln -s ~/.etc/.default-gems .default-gems
ln -s ~/.etc/.default-npm-packages .default-npm-packages
ln -s ~/.etc/nvim/custom ~/.config/nvim/lua/custom
ECHO 'Yey, good to go!'
