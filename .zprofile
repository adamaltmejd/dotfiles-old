# Rbenv (https://github.com/sstephenson/rbenv) installed with Homebrew
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Load the shell dotfiles
for file in ~/.adamaltmejd/{path,exports,aliases,functions}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;
