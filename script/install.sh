#!/bin/bash

set -e

command_exist() {
  command -v "$1" > /dev/null 2>&1
  return $?
}

installation_path="$HOME/src/github.com/increments/dotfiles-for-designers"

if ! command_exist git; then
  echo "Installing git..."
  if command_exist brew; then
    brew install git
  else
    echo "Cannot install git. Aborting."
    exit 1
  fi
fi

if [[ ! -d "$installation_path" ]]; then
  echo "Cloning increments/dotfiles-for-designers..."
  git clone --recursive https://github.com/increments/dotfiles-for-designers.git "$installation_path"
fi

if [[ ! -d "${ZDOTDIR:-$HOME}/.zprezto" ]]; then
  echo "Installing zprezto..."
  git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

  for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/* ; do
    if [[ ! -e "$installation_path/$rcfile" ]]; then
      ln -s "$rcfile" "$ZDOTDIR:-$HOME}/.${rcfile}"
    fi
  done
fi

cd $installation_path

case $OSTYPE in
darwin*) ./script/setup_osx.sh;;
esac

./bin/dotfiles-sync

echo "Done."
