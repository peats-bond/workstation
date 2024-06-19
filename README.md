# Workstation

My workstation setup: installation, tools, dotfiles, etc.

```
# install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# setup github
brew install gh
gh auth login

cd ~
git init .
git remote add origin git@github.com:peats-bond/workstation.git
git pull origin main
git branch --set-upstream-to=origin/main main
./.workstation/install.zsh
```
