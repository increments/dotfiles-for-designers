#!/bin/bash

set -eu

restore() {
  file_in_home="$HOME/.$1"
  file_in_backup="$HOME/.backup/dotfiles-for-designers/.$1"

  echo "Restoring $file_in_home"
  rm $file_in_home
  mv $HOME/.backup/dotfiles-for-designers/$1 $HOME/
}

dotfiles_root=$HOME/src/github.com/increments/dotfiles-for-designers

if [[ ! -d $dotfiles_root ]] ; then
  echo "increments/dotfiles-for-designers is not installed"
  exit 1
fi

cd $dotfiles_root

except=(
  Brewfile
  README.md
  bin
  script
  zsh
)
for file in *; do
  filename="$(basename "$file")"
  if [[ ! " ${except[@]} " =~ " ${filename} " ]] ; then
    restore $filename
  fi
done

echo "Done"
