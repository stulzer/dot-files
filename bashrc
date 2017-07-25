homebrew=/usr/local/bin:/usr/local/sbin
export EDITOR=nvim
export PATH="$HOME/.rbenv/bin:$homebrew:$PATH"
export PATH="/usr/local/share/npm/bin:${PATH}"
export PATH="/usr/local/heroku/bin:$PATH"
eval "$(rbenv init -)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

. /usr/local/etc/bash_completion.d/git-completion.bash
. /usr/local/etc/bash_completion.d/git-prompt.sh

. ~/.etc/bash/aliases
. ~/.etc/bash/config
. ~/.etc/bash/functions
. ~/.etc/bash/tmuxinator
. ~/.etc/env/vars

[[ -z "$TMUX" ]] && exec tmux
