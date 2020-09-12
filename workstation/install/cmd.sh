#!/bin/bash

shell="emacs tig"
navigation="rg fasd tree direnv"
analysis="mitmproxy htop cloc colordiff"
dev="markdown shellcheck"

################ Install ################
all="$shell $navigation $analysis $dev" 
echo "${all}" | xargs brew install
