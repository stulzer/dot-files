case "$(uname -s)" in
   Darwin)
     ./bashrc_macos
     ;;

   Linux)
     ./bashrc_linux
     ;;

   *)
     echo 'Incompatible OS'
     ;;
esac

export EDITOR=nvim
export FZF_DEFAULT_COMMAND='rg --files'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

. ~/.etc/bash/aliases
. ~/.etc/bash/config
. ~/.etc/bash/functions
. ~/.etc/bash/tmuxinator
. ~/.etc/env/vars

[[ -z "$TMUX" ]] && exec tmux

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
