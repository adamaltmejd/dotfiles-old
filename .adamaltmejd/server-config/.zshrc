# INTERACTIVE ZSH SHELL
source $HOME/.dotfiles/term-config

source $HOME/.dotfiles/exports
source $HOME/.dotfiles/key_bindings
source $HOME/.dotfiles/aliases
source $HOME/.dotfiles/functions

# Compinit
_zpcompinit_custom

# No ZSH prompt
autoload -Uz promptinit
promptinit
prompt off

# Automatically attach default tmux session on ssh login
if [ -z "$TMUX" ] && [ -n "$SSH_TTY" ] && [[ $- =~ i ]]; then
    tmux new-session -A -s default
fi
