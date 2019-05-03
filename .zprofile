# `.zprofile' is similar to `.zlogin', except that it is sourced before `.zshrc'.

source ~/.adamaltmejd/exports
source ~/.adamaltmejd/exports.local
source ~/.adamaltmejd/path

# Load rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Load perl
eval "$(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib=$HOME/perl5)"