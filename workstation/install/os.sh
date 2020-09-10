#!/bin/bash

# xcode command line tools
xcode-select --install

# brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
brew upgrade
brew cask install iterm2 spectacle visual-studio-code
