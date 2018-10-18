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
    if [ ! -d ~/.gnupg/ ]; then;
        mkdir ~/.gnupg;
        chmod 700 ~/.gnupg
    fi
    for src in "gpg.conf" "gpg-agent.conf"; do
        src="$(pwd -P)/.adamaltmejd/$src"
        dst="$HOME/.gnupg/$(basename "$src")"
        if [[ -f "$dst" || -d "$dst" || -L "$dst" ]]; then
            mv "$dst" "$dst-debug"
        fi
        ln -s "$src" "$dst"
        chmod 600 ~/.gnupg/*
    done

    # SSH config
    if [ ! -d ~/.ssh/ ]; then; mkdir ~/.ssh; fi
    echo "Include ~/.adamaltmejd/ssh-config" >> ~/.ssh/config

    # Local R directory
    if [ ! -d ~/.R/ ]; then; mkdir ~/.R; fi
    if [ ! -d ~/.R/packages ]; then; mkdir ~/.R/packages; fi
    cp ~/.adamaltmejd/R/Makevars-data-table ~/.R/Makevars-data-table
fi

echo "Set zsh as default shell? (Y/N)"
read -k 1 REPLY; echo ''
if [[ $REPLY =~ ^[Yy]$ ]]; then
    # Set default shell to homebrew zsh
    sudo sh -c "echo /usr/local/bin/zsh >> /etc/shells"
    chsh -s /usr/local/bin/zsh
fi

echo 'Ta da!'
