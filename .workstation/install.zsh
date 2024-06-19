#!/bin/zsh

# xcode
xcode-select --install

# zprezto
git submodule update --init --recursive

# brew
brew upgrade

brew install --cask \
    docker \
    google-chrome \
    google-drive \
    gh \
    iterm2 \
    messenger \
    notion \
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

# nvm - https://github.com/nvm-sh/nvm?tab=readme-ov-file#installing-and-updating
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

# done
open -a iterm
exit
