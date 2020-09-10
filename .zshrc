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

# Source .profile files
ls ~/.profile_* 1> /dev/null 2>&1 && for f in ~/.profile_*; do source $f; done
[ -r /Users/apeatsbond/.profile_lda ] && . /Users/apeatsbond/.profile_lda

# direnv
eval "$(direnv hook zsh)"

