#!/usr/bin/env zsh

# Run this script when setting up a new computer
echo "Installing dotfiles on new computer..."

# Wipe all (default) app icons from the Dock
# This is only really useful when setting up a new Mac, or if you don’t use
# the Dock to launch apps.
defaults write com.apple.dock persistent-apps -array

echo "Install applications with Homebrew? (Y/N)"
read -k 1 REPLY; echo ''
if [[ $REPLY =~ ^[Yy]$ ]]; then
    # Install homebrew if not already installed
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

    # If brew is already installed make sure its updated
    brew update
    brew upgrade --all --cleanup

    # Run Homebrew through Brewfile
    brew bundle

    # Remove outdated versions from the cellar.
    brew cleanup

    # Check so everything is in order
    brew doctor
fi

echo "Set new OSX default preferences? (Y/N)"
read -k 1 REPLY; echo ''
if [[ $REPLY =~ ^[Yy]$ ]]; then
    source .adamaltmejd/osx
fi

echo "Install oh-my-zsh? (Y/N)"
read -k 1 REPLY; echo ''
if [[ $REPLY =~ ^[Yy]$ ]]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

echo "Symlink dotfiles (Y/N)"
read -k 1 REPLY; echo ''
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "All files that would have been overwritten will be backed up to ~/dotfiles_backup/"
    for src in $(find -H `pwd -P` -maxdepth 1 -name '.*' -not -name '.gitignore' -not -name '.DS_Store' -not -path '*.git'); do
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
fi

echo 'Ta da!'
