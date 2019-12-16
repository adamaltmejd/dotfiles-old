#!/usr/local/bin/zsh
# `.zshrc' is sourced in interactive shells. It should contain commands to set
# up aliases, functions, options, key bindings, etc.

source ~/.adamaltmejd/term-config

######
# Antibody
# Static loading
source ~/.zsh_plugins.sh
# To load (after e.g. including more plugins), run:
# antibody bundle < ~/.adamaltmejd/zsh-plugins > ~/.zsh_plugins.sh

# Load completions
autoload -Uz compinit
if [ $(date +'%j') != $(/usr/bin/stat -f '%Sm' -t '%j' ${ZDOTDIR:-$HOME}/.zcompdump) ]; then
  compinit
else
  compinit -C
fi

######
# Aliases and functions
source ~/.adamaltmejd/aliases
source ~/.adamaltmejd/functions
source ~/.adamaltmejd/key_bindings
