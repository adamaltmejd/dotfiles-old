#!/usr/local/bin/zsh
# `.zprofile' is similar to `.zlogin', except that it is sourced before `.zshrc'.

source ~/.adamaltmejd/exports
source ~/.adamaltmejd/exports.local
source ~/.adamaltmejd/path

# Lazy-Load rbenv
rbenv() {
  eval "$(command rbenv init -)"
  rbenv "$@"
}

# Lazy-load perl
perl() {
    eval "$(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib=$HOME/perl5)"
    perl "$@"
}

# Lazy-load virtualenvwrapper
source /usr/local/bin/virtualenvwrapper_lazy.sh

#####
# GPG for SSH
gpgconf --launch gpg-agent
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
