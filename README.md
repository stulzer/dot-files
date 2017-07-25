# OSX Environment

## Dependencies

#### Powerline font
https://github.com/powerline/fonts/tree/master/Inconsolata

#### Heroku Toolbelt
https://toolbelt.heroku.com/

#### brew
http://brew.sh/

#### rbenv
https://github.com/rbenv/rbenv

#### Node
```
brew install node
```

#### nvm
```
brew install nvm
```

#### Tmux
```
brew install tmux
brew install reattach-to-user-namespace
```

#### Neovim
```
brew install neovim
```

#### Ripgrep
```
brew install ripgrep
```

#### Install Neovim Minimalist Plugin
```
open https://github.com/junegunn/vim-plug#neovim
```

#### Python
```
brew install python
```

### Pip
```
sudo easy_install pip
```

#### Powerline
```
pip install --user git+git://github.com/Lokaltog/powerline
```

## Dot files

### Clone repository to ~/.etc
```
git clone https://github.com/stulzer/dot-files ~/.etc/
```

### Symlink all configurations, on home directory ~/

```
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
```

### Installing Plugins on Neovim

Fire Neovim

```
nvim
```

and then

```
:PlugInstall
```

### Maybe useless

Add this to /etc/profile

```
# https://github.com/sstephenson/rbenv/issues/369#issuecomment-20910233

if [[ -z $TMUX ]] && [ -x /usr/libexec/path_helper ]; then
  eval `/usr/libexec/path_helper -s`
fi
```

