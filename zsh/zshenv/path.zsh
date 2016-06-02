typeset -U path

path=("$DOTFILES_ROOT/bin" /usr/local/bin $path)

if [[ -d "$HOME/bin" ]]; then
    path=("$HOME/bin" $path)
fi
