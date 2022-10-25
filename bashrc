source ~/.git-prompt.sh

. ~/.etc/bashrc_macos

export EDITOR=nvim
export FZF_DEFAULT_COMMAND='rg --files'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

. ~/.git-prompt.sh
. ~/.etc/bash/aliases
. ~/.etc/bash/config
. ~/.etc/bash/functions
. ~/.etc/bash/tmuxinator
. ~/.etc/env/vars

if [[ $TERM_PROGRAM != "WarpTerminal" ]]; then
  # disabling to warp
  [[ -z "$TMUX" ]] && exec tmux
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
