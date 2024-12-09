#!/usr/local/bin/zsh
# `.zprofile' is similar to `.zlogin', except that it is sourced before `.zshrc'.

# Exports
source ~/.adamaltmejd/exports
source ~/.adamaltmejd/exports.local
source ~/.adamaltmejd/path
# OSX path helper
if [ -x /usr/libexec/path_helper ]; then
    eval `/usr/libexec/path_helper -s`
fi
# Homebrew
if [[ -x /usr/local/bin/brew ]]; then
  eval $(/usr/local/bin/brew shellenv)
fi
if [[ -x /opt/homebrew/bin/brew ]]; then
  eval $(/opt/homebrew/bin/brew shellenv)
fi

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

#####
# GPG for SSH
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent