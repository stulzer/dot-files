if [ -z "$TMUX" ]; then
  unset POSIXLY_CORRECT
fi

. ~/.etc/bashrc_macos

export EDITOR=nvim
export FZF_DEFAULT_OPTS="--height 40% --border --color=bg+:#251a50,border:#ff0070,gutter:-1"
export FZF_DEFAULT_COMMAND='rg --files'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

. ~/.git-prompt.sh
. ~/.etc/bash/aliases
. ~/.etc/bash/config
. ~/.etc/bash/functions
. ~/.etc/bash/tmuxinator
. ~/.etc/env/vars

# [[ -z "$TMUX" ]] && exec tmux

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
