#!/bin/bash

shell="zsh emacs"
navigation="rg fasd tree direnv"
git="tig hub"
analysis="mitmproxy htop cloc colordiff"
dev="markdown shellcheck"

################ Install ################
all="$shell $navigation $git $analysis $dev"
echo "${all}" | xargs brew install
