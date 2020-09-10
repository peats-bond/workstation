#!/bin/bash

shell="zsh emacs"
navigation="rg fasd tree direnv"
git="tig hub"
analysis="mitmproxy htop cloc colordiff"
dev="markdown shellcheck"

tools=($shell $navigation $git $analysis $dev)

################ Install ################
echo "## installing tools: ${tools[@]}"
for i in "${tools[@]}"
do
    	brew install $i
done
