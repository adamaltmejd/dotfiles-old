#!/usr/bin/env zsh

# Run this script when setting up a new computer
echo "Installing dotfiles on new computer..."

echo "Install applications with Homebrew? (Y/N)"
read -k 1 REPLY; echo ''
if [[ $REPLY =~ ^[Yy]$ ]]; then
    # Install homebrew if not already installed
    if [[ ! -x /usr/local/bin/brew && ! -x /opt/homebrew/bin/brew ]]; then
        echo "Installing Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi

    # Put Brew on PATH temporarily
    if [[ -x /opt/homebrew/bin/brew ]]; then
        eval $(/opt/homebrew/bin/brew shellenv)
    fi
    if [[ -x /usr/local/bin/brew ]]; then
        eval $(/usr/local/bin/brew shellenv)
    fi

    # If brew is already installed make sure its updated
    brew update
    brew upgrade

    # Run Homebrew through Brewfile
    brew bundle

    # Remove outdated versions from the cellar.
    brew cleanup

    # Check so everything is in order
    brew doctor
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
    echo "Include ~/.adamaltmejd/ssh/*" >> ~/.ssh/config

    # Local R directory
    if [ ! -d ~/.R/ ]; then; mkdir ~/.R; fi
    if [ ! -d ~/.R/packages ]; then; mkdir ~/.R/packages; fi
    ln -s ~/.adamaltmejd/R/Makevars ~/.R/Makevars
fi

echo "Set zsh as default shell? (Y/N)"
read -k 1 REPLY; echo ''
if [[ $REPLY =~ ^[Yy]$ ]]; then
    # Set default shell to homebrew zsh
    if [[ -x /opt/homebrew/bin/brew ]]; then
        eval $(/opt/homebrew/bin/brew shellenv)
    fi
    if [[ -x /usr/local/bin/brew ]]; then
        eval $(/usr/local/bin/brew shellenv)
    fi
    sudo sh -c "echo $HOMEBREW_PREFIX/bin/zsh >> /etc/shells"
    chsh -s $HOMEBREW_PREFIX/bin/zsh
fi

echo 'Ta da!'
