#!/bin/bash

################ Vars ################
# tools
shell="zsh zprezto emacs"
navigation="rg fasd ranger"
dev="mitmproxy tig"

tools=($shell $navigation $dev)

################ Init ################
# xcode command line tools
xcode-select --install

# brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew upgrade

################ Install ################
echo "## tools: ${tools[@]}"
for i in "${tools[@]}"
do
    	brew install $i
done

################ Finishing  ################
# switch shell to zsh
chsh -s /bin/zsh
