#!/bin/bash

# xcode
xcode-select --install

# zprezto
git submodule update --init --recursive

# brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
brew upgrade

brew cask install \
    google-chrome \
    iterm2 \
    notion \
    slack \
    spectacle \
    spotify \
    visual-studio-code

brew install \
    cloc \
    colordiff \
    direnv \
    emacs \
    htop \
    markdown \
    mitmproxy \
    rg \
    shellcheck \
    tig \
    tree

# language
source install/golang.sh
source install/python.sh
source install/javascript.sh
