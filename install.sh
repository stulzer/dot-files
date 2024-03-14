ECHO 'Using bash instead of zsh'
chsh -s /bin/bash
ECHO 'Installing brew'
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
ECHO 'Installing dependencies through brew'
brew install git node tmux reattach-to-user-namespace neovim ripgrep asdf python fzf bash rename kitty font-jetbrains-mono-nerd-font
ECHO 'Installing Heroku Toolbelt'
brew tap heroku/brew && brew install heroku
ECHO 'Installing pip through easy install'
ECHO 'Type your password when asked'
sudo easy_install pip
ECHO 'Installing powerline'
pip install --user git+git://github.com/Lokaltog/powerline
ECHO 'Installing neovim packages'
gem install neovim
pip install neovim
npm install -g neovim
ECHO 'Cloning dot files'
git clone https://github.com/stulzer/dot-files ~/.etc/
ECHO 'Creating and symlinking configurations'
cd ~
mkdir .ssh .secrets .config .config/nvim .config/kitty
touch ~/.secrets/vars
ln -s ~/.secrets/vars ~/.etc/env/vars
ln -s ~/.etc/kitty/kitty.conf ~/.config/kitty/kitty.conf
ln -s ~/.etc/bash_profile .bash_profile
ln -s ~/.etc/bashrc .bashrc
ln -s ~/.etc/gemrc .gemrc
ln -s ~/.etc/gitignore .gitignore
ln -s ~/.etc/gitk .gitk
ln -s ~/.etc/rspec .rspec
ln -s ~/.etc/tmux.conf .tmux.conf
ln -s ~/.etc/ssh/config .ssh/config
ln -s ~/.etc/ssh/config .ssh/config
ln -s ~/.etc/.tool-versions .tool-versions
ln -s ~/.etc/.asdfrc .asdfrc
ln -s ~/.etc/.default-gems .default-gems
ln -s ~/.etc/.default-npm-packages .default-npm-packages
ln -s ~/.etc/nvim ~/.config/nvim
ECHO 'Yey, good to go!'
