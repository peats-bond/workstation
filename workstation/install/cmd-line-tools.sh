#!/bin/bash

shell="zsh emacs"
navigation="rg fasd ranger tree"
dev="mitmproxy tig hub htop markdown colordiff direnv"

tools=($shell $navigation $dev)

################ Install ################
echo "## installing tools: ${tools[@]}"
for i in "${tools[@]}"
do
    	brew install $i
done
