#!/bin/bash

shell="zsh emacs"
navigation="rg fasd tree direnv"
git="tig hub"
analysis="mitmproxy htop cloc colordiff"
dev="markdown"

tools=($shell $navigation $git $dev)

################ Install ################
echo "## installing tools: ${tools[@]}"
for i in "${tools[@]}"
do
    	brew install $i
done
