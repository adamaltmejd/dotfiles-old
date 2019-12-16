#!/usr/local/bin/zsh
# `.zshrc' is sourced in interactive shells. It should contain commands to set
# up aliases, functions, options, key bindings, etc.

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/.adamaltmejd/term-config

# Antibody static loading
source ~/.zsh_plugins.sh
# To load (after including more plugins), run:
# antibody bundle < ~/.adamaltmejd/zsh-plugins > ~/.zsh_plugins.sh

# Load completions
autoload -Uz compinit
if [[ -n ~/.zcompdump(#qN.mh+24) ]]; then
  compinit
  touch .zcompdump
else
  compinit -C
fi

######
# Aliases and functions
source ~/.adamaltmejd/aliases
source ~/.adamaltmejd/functions
source ~/.adamaltmejd/key_bindings

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
