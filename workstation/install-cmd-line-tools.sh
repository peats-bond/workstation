#!/bin/bash

shell="zsh emacs"
navigation="rg fasd ranger"
dev="mitmproxy tig"

tools=($shell $navigation $dev)

################ Install ################
echo "## installing tools: ${tools[@]}"
for i in "${tools[@]}"
do
    	brew install $i
done
