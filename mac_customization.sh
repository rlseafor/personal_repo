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

# Install Homebrew
