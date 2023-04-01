#!/bin/zsh

# xcode
xcode-select --install

# zprezto
git submodule update --init --recursive

# brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
brew upgrade

brew install --cask \
    docker \
    google-chrome \
    google-drive \
    iterm2 \
    messenger \
    notion \
    nvm \
    postico \
    slack \
    spectacle \
    spotify \
    visual-studio-code \
    whatsapp

brew install \
    cloc \
    colordiff \
    direnv \
    emacs \
    git-absorb \
    htop \
    markdown \
    mitmproxy \
    rg \
    shellcheck \
    tig \
    tree

# done
open -a iterm
exit
