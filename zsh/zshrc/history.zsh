HISTFILE=$HOME/.zsh-history # history file
HISTSIZE=10000              # number of saved history on memory
SAVEHIST=10000              # number of saved history
setopt hist_ignore_all_dups # ignore duplicated history
setopt hist_reduce_blanks   # strip white spaces
setopt hist_no_store        # ignore history command
setopt hist_ignore_space    # ignore command starts with white spaces
setopt extended_history     # current time is also saved
setopt share_history        # share history across multi processes
setopt append_history
setopt inc_append_history
setopt hist_verify          # can edit history before execute it

# short cut
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# incremental search
bindkey "^R" history-incremental-search-backward
bindkey "^S" history-incremental-search-forward
