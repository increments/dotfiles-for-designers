export DOTFILES_ROOT=$HOME/src/github.com/increments/dotfiles-for-designers

for file in ${DOTFILES_ROOT}/zsh/zshenv/*; do
    source "$file"
done

[ -f ~/.zshenv.local ] && source ~/.zshenv.local
