homebrew=/usr/local/bin:/usr/local/sbin
export EDITOR=nvim
export PATH="$HOME/.rbenv/bin:$homebrew:$PATH"
export PATH="/usr/local/share/npm/bin:${PATH}"
export PATH="/usr/local/heroku/bin:$PATH"
export GOPATH=$HOME/Code/gocode
export PATH=$PATH:$GOPATH/bin
export GPG_TTY=$(tty)
export PATH="/usr/local/opt/postgresql@9.6/bin:$PATH"
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
eval "$(rbenv init -)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

### Improving fzf file search
export FZF_DEFAULT_COMMAND='rg --files'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

. /usr/local/etc/bash_completion.d/git-completion.bash
. /usr/local/etc/bash_completion.d/git-prompt.sh

. ~/.etc/bash/aliases
. ~/.etc/bash/config
. ~/.etc/bash/functions
. ~/.etc/bash/tmuxinator
. ~/.etc/env/vars

# colorls bash completion
source $(dirname $(gem which colorls))/tab_complete.sh

[[ -z "$TMUX" ]] && exec tmux

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

if type brew &>/dev/null; then
  for COMPLETION in $(brew --prefix)/etc/bash_completion.d/*
  do
    [[ -f $COMPLETION ]] && source "$COMPLETION"
  done
  if [[ -f $(brew --prefix)/etc/profile.d/bash_completion.sh ]];
  then
    source "$(brew --prefix)/etc/profile.d/bash_completion.sh"
  fi
fi
