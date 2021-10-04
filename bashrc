export EDITOR=vim
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# brew code
homebrew=/usr/local/bin:/usr/local/sbin

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

# export PATH="/usr/local/heroku/bin:$PATH"
# export PATH="/usr/local/opt/node@10/bin:$PATH"
# export PATH="/usr/local/opt/postgresql@9.6/bin:$PATH"
# export PATH="/usr/local/share/npm/bin:${PATH}"
# export PATH=$PATH:$GOPATH/bin
# export GOPATH=$HOME/Code/gocode
# export GPG_TTY=$(tty)
# export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# export GUILE_LOAD_PATH="/usr/local/share/guile/site/3.0"
# export GUILE_LOAD_COMPILED_PATH="/usr/local/lib/guile/3.0/site-ccache"
# export GUILE_SYSTEM_EXTENSIONS_PATH="/usr/local/lib/guile/3.0/extensions"

### Added by the Heroku Toolbelt
# export PATH="/usr/local/heroku/bin:$PATH"

### Improving fzf file search
# export FZF_DEFAULT_COMMAND='rg --files'
# export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# . /usr/local/etc/bash_completion.d/git-completion.bash
# . /usr/local/etc/bash_completion.d/git-prompt.sh

# . ~/.etc/bash/aliases
# . ~/.etc/bash/config
# . ~/.etc/bash/functions
# . ~/.etc/bash/tmuxinator
# . ~/.etc/env/vars
# . $(brew --prefix asdf)/asdf.sh

# [[ -z "$TMUX" ]] && exec tmux

# [ -f ~/.fzf.bash ] && source ~/.fzf.bash
