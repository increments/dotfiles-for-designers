# Load all functions in zsh/functions directory lazily
fpath=(${DOTFILES_ROOT}/zsh/functions(N-/) $fpath)
for i in $(ls ${DOTFILES_ROOT}/zsh/functions) ; do
    autoload -U $i
done

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Enable zsh version conditional branch.
autoload -Uz is-at-least

# Enable hook function manipulation.
autoload -Uz add-zsh-hook

for file in ${DOTFILES_ROOT}/zsh/zshrc/*; do
    source "$file"
done
