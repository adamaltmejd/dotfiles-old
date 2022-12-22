#!/usr/local/bin/zsh
# `.zshrc' is sourced in interactive shells. It should contain commands to set
# up aliases, functions, options, key bindings, etc.

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source $HOME/.adamaltmejd/term-config

# Antidote static loading
source /opt/homebrew/opt/antidote/share/antidote/antidote.zsh
# initialize plugins statically with ${ZDOTDIR:-~}/.zsh_plugins.txt
antidote load

# Load completions
autoload -Uz compinit
if [[ -n $HOME/.zcompdump(#qN.mh+24) ]]; then
  compinit
  touch $HOME/.zcompdump
else
  compinit -C
fi

######
# Aliases and functions
source $HOME/.adamaltmejd/aliases
source $HOME/.adamaltmejd/functions
source $HOME/.adamaltmejd/key_bindings

# To customize prompt, run `p10k configure` or edit $HOME/.p10k.zsh.
[[ ! -f $HOME/.p10k.zsh ]] || source $HOME/.p10k.zsh
