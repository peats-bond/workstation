#!/bin/bash

# xcode command line tools
xcode-select --install

# brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew upgrade
brew tap caskroom/cask
