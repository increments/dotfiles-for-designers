# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Enable zsh version conditional branch.
autoload -Uz is-at-least

# Enable hook function manipulation.
autoload -Uz add-zsh-hook

# Load all functions in zfunctions directory lazily
fpath=(${DOTFILES_ROOT}/zfunctions(N-/) $fpath)
for i in $(ls ${DOTFILES_ROOT}/zfunctions) ; do
    autoload -U $i
done

for file in ${DOTFILES_ROOT}/zshrc.d/*; do
    source "$file"
done
