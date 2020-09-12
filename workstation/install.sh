#!/bin/bash

shell="emacs tig"
navigation="rg fasd tree direnv"
analysis="mitmproxy htop cloc colordiff"
dev="markdown shellcheck"

# xcode
xcode-select --install

# git
git config --global core.excludesfile ~/.gitignore_global

# zprezto
git submodule update --init --recursive 

# brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
brew upgrade

brew cask install iterm2 spectacle visual-studio-code slack chrome
echo "$shell $navigation $analysis $dev"  | xargs brew install

# language
source install/golang.sh
source install/python.sh
