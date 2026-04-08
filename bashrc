# if [ -z "$TMUX" ]; then
#   unset POSIXLY_CORRECT
# fi

export EDITOR=nvim
export FZF_DEFAULT_OPTS="--height 40% --border --color=bg+:#251a50,border:#ff0070,gutter:-1"
export FZF_DEFAULT_COMMAND='rg --files'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export CLAUDE_CODE_EFFORT_LEVEL=max

. ~/.config/dot-files/bash/aliases
. ~/.config/dot-files/bash/config
. ~/.config/dot-files/bash/functions
. ~/.config/dot-files/bash/tmuxinator
. ~/.config/dot-files/env/vars
. /usr/share/git/git-prompt.sh

export PATH="/home/stz/.cargo/bin:$PATH"

# [[ -z "$TMUX" ]] && exec tmux

# [ -f ~/.fzf.bash ] && source ~/.fzf.bash

eval "$(/home/stz/.local/bin/mise activate bash)"
