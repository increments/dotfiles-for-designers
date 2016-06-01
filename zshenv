export DOTFILES_ROOT=$HOME/src/github.com/htomine/dotfiles

for file in $DOTFILES_ROOT/zshenv.d/*; do
    source "$file"
done

[ -f ~/.zshenv.local ] && source ~/.zshenv.local
