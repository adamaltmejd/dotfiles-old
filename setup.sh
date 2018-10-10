#!/usr/bin/env zsh

# Run this script when setting up a new computer
echo "Installing dotfiles on new computer..."

echo "Install applications with Homebrew? (Y/N)"
read -k 1 REPLY; echo ''
if [[ $REPLY =~ ^[Yy]$ ]]; then
    # Install homebrew if not already installed
    if [ ! -x /usr/local/bin/brew ]; then
        echo "Installing Homebrew..."
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi

    # Put Brew on PATH temporarily
    export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

    # If brew is already installed make sure its updated
    brew update
    brew upgrade --all --cleanup

    # Run Homebrew through Brewfile
    brew bundle

    # Remove outdated versions from the cellar.
    brew cleanup
    brew cask cleanup

    # Check so everything is in order
    brew doctor
fi

echo "Set new MacOS default preferences? (Y/N)"
read -k 1 REPLY; echo ''
if [[ $REPLY =~ ^[Yy]$ ]]; then
    source .adamaltmejd/macos
fi

echo "Install oh-my-zsh? (Y/N)"
read -k 1 REPLY; echo ''
if [[ $REPLY =~ ^[Yy]$ ]]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

echo "Create symlinks (Y/N)"
read -k 1 REPLY; echo ''
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "All files that would have been overwritten will be backed up to ~/dotfiles_backup/"
    for src in $(find -H `pwd -P` -maxdepth 1 -name '.*' -not -name '.gitignore' -not -name '.DS_Store' -not -path '*.git' -not -path '*.atom'); do
        dst="$HOME/$(basename "$src")"

        # If file exists move it to backup
        if [[ -f "$dst" || -d "$dst" || -L "$dst" ]]; then
            if [ ! -d ~/dotfiles_backup/ ]; then; mkdir ~/dotfiles_backup; fi
            mv "$dst" ~/dotfiles_backup
        fi

        # Create symbolic link
        ln -s "$src" "$dst"
    done
    unset src dst

    # Symlink gpg conf files
    if [ ! -d ~/.gnupg/ ]; then; mkdir ~/.gnupg; fi
    for src in "gpg.conf" "gpg-agent.conf"; do
        src="$(pwd -P)/.adamaltmejd/$src"
        dst="$HOME/.gnupg/$(basename "$src")"
        if [[ -f "$dst" || -d "$dst" || -L "$dst" ]]; then
            mv "$dst" "$dst-debug"
        fi
        ln -s "$src" "$dst"
    done
fi

echo 'Ta da!'
