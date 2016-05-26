export ZLS_COLORS=$LS_COLORS
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# Use full complement functionality
autoload -Uz compinit; compinit -u
setopt auto_list            # Show all candidates
setopt auto_menu            # Toggle complement candidates using TAB
setopt auto_param_slash     # Insert / after a complemented directory name
setopt correct              # Do spell check
setopt list_packed          # Use compackt style candidates viewer mode
setopt list_types           # Show kinds of file using marks
setopt magic_equal_subst    # Even option args are complemented
# Can use Emacs style keybind to select candidates
zstyle ':completion:*:default' menu select=1
# Complement process name with kill command
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([%0-9]#)*=0=01;31'
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin/bin
# Don't show current directory
zstyle ':completion:*' ignore-parents parent pwd
