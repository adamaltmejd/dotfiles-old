# `.zshrc' is sourced in interactive shells. It should contain commands to set
# up aliases, functions, options, key bindings, etc.

# Seems like PATH is somehow overwritten, so we source env again
source ~/.zshenv

# ZSH config
export ZSH=$HOME/.oh-my-zsh
export ZSH_THEME="nanotech"
DISABLE_UPDATE_PROMPT=true
# DISABLE_AUTO_UPDATE="true"
ENABLE_CORRECTION="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
plugins=(git history-substring-search osx brew sublime zsh-syntax-highlighting command-not-found colored-man-pages colorize)
# Init oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Iterm2 Shell Integration
source ~/.iterm2_shell_integration.zsh

# Init zsh online help
unalias run-help
autoload run-help
HELPDIR=/usr/local/share/zsh/help

# Load my own settings (overwrites oh-my-zsh if necessary)
source ~/.adamaltmejd/aliases
source ~/.adamaltmejd/functions

#archey: display apple logo and computer stats
archey
