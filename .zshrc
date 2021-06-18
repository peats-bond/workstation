#
# Executes commands at the start of an interactive session.
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# ls
alias ls='ls -a'

# tree
alias t='tree -a -L 1'

# Fun Aliases
alias shrug="echo '¯\_(ツ)_/¯' | pbcopy; echo '¯\_(ツ)_/¯'"
alias tableflip='echo "(╯°□°)╯︵ ┻━┻" | pbcopy; echo "(╯°□°)╯︵ ┻━┻"'
alias partyparrot="curl parrot.live"

# direnv
eval "$(direnv hook zsh)"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
