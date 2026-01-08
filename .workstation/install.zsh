#!/bin/zsh

# xcode
xcode-select --install

# zprezto
git submodule update --init --recursive

# brew
brew upgrade

brew install --cask \
    akiflow \
    dbeaver-community \
    chatgpt \ 
    docker \
    google-chrome \
    google-cloud-sdk \
    google-drive \
    iterm2 \
    notunes \
    postico \
    slack \
    rectangle \
    spotify \
    visual-studio-code \
    whatsapp \
    zoom

brew install \
    cloc \
    colordiff \
    direnv \
    emacs \
    fzf \
    git-absorb \
    gh \
    htop \
    markdown \
    mitmproxy \
    rg \
    shellcheck \
    tig \
    tree

# notunes - default to spotify
defaults write digital.twisted.noTunes replacement /Applications/Spotify.app

# nvm - https://github.com/nvm-sh/nvm?tab=readme-ov-file#installing-and-updating
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

# done
open -a iterm
exit
