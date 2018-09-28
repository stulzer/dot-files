ECHO 'Installing dependencies through brew'
brew install git node nvm tmux reattach-to-user-namespace neovim ripgrep python python@2 heroku rbenv ruby-build fzf
ECHO 'Installing pip through easy install'
ECHO 'Type your password when asked'
sudo easy_install pip
ECHO 'Installing powerline'
pip install --user git+git://github.com/Lokaltog/powerline
ECHO 'Installing ruby and making it global'
rbenv install 2.5.1
rbenv global 2.5.1
ECHO 'Installing neovim packages'
gem install neovim
pip2.7 install neovim
pip3 install neovim
npm install -g neovim
ECHO 'Cloning dot files'
git clone https://github.com/stulzer/dot-files ~/.etc/
ECHO 'Creating and symlinking configurations'
cd ~
mkdir .ssh .secrets .config .config/nvim
touch ~/.secrets/vars
ln -s ~/.secrets/vars ~/.etc/env/vars
ln -s ~/.etc/nvim/init.vim ~/.config/nvim/init.vim
ln -s ~/.etc/bash_profile .bash_profile
ln -s ~/.etc/bashrc .bashrc
ln -s ~/.etc/gemrc .gemrc
ln -s ~/.etc/gitignore .gitignore
ln -s ~/.etc/gitk .gitk
ln -s ~/.etc/powconfig .powconfig
ln -s ~/.etc/rspec .rspec
ln -s ~/.etc/tmux.conf .tmux.conf
ln -s ~/.etc/ssh/config .ssh/config
ECHO 'Yey, good to go!'
