#!/bin/bash

DIR=$HOME/Desktop/screenshots
echo "Checking for $DIR directory"

# Check for screenshots directory
if [[ ! -d $DIR ]]
then
  echo "$DIR exists, writing defaults"
  mkdir $DIR
fi

defaults write com.apple.screencapture location $DIR

# Check to see if Homebrew is installed, if not installed
which -s brew
if [[ $? != 0 ]] ; then
    # Install Homebrew
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    brew update
fi

# List of casks to install, then install
CASKS=(
  "sublime-text"
  "iterm2"
  "atom"
)

brew cask install $CASKS

# List of packages to install, then install
BREW_INSTALLS=(
  "tree"
  "jq"
)
brew install $BREW_INSTALLS
