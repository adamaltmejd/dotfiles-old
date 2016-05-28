# `.zshenv' is sourced on all invocations of the shell, unless the -f option is
# set. It should contain commands to set the command search path, plus other
# important environment variables. `.zshenv' should not contain commands that
# produce output or assume the shell is attached to a tty.

source ~/.adamaltmejd/exports
source ~/.adamaltmejd/path

# Rbenv (https://github.com/sstephenson/rbenv) installed with Homebrew
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
