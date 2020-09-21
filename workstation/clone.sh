#!/bin/bash

# cloning workstation into home directory
git init .
git remote add origin git@github.com:peats-bond/workstation.git
git pull origin master
git branch --set-upstream-to=origin/master master
