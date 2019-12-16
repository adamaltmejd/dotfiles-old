#!/usr/local/bin/zsh
# `.zshenv' is sourced on all invocations of the shell, unless the -f option is
# set. It should contain commands to set the command search path, plus other
# important environment variables. `.zshenv' should not contain commands that
# produce output or assume the shell is attached to a tty.

# Only for NON-interactive environmental variables!

# Problem with using this to set the path is that /etc/profile is loaded after
# Better to use .zprofile
