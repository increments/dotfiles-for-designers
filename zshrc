# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

export DOTFILES_ROOT=$(ghq root)/htomine/dotfiles

typeset -U path

# Enable zsh version conditional branch.
autoload -Uz is-at-least

# Enable hook function manipulation.
autoload -Uz add-zsh-hook

for file in "${DOTFILES_ROOT}/zshrc.d/*"; do
    source "$file"
done
