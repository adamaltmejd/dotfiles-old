# Don't source .zprofile if in non-interactive shell
[ -n "$PS1" ] && source ~/.zprofile;

# ZSH config
export ZSH=$HOME/.oh-my-zsh
export ZSH_THEME="nanotech"
DISABLE_UPDATE_PROMPT=true
ENABLE_CORRECTION="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
plugins=(git history-substring-search osx brew sublime zsh-syntax-highlighting command-not-found colored-man-pages colorize)

# Init zsh online help
unalias run-help
autoload run-help
HELPDIR=/usr/local/share/zsh/help

# Init oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Iterm2 Shell Integration
source ~/.iterm2_shell_integration.zsh
