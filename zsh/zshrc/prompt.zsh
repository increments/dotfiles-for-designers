autoload -U colors
colors

# If nonnegative, commands whose combined user and system execution times (measured in seconds) are
# greater than this value have timing statistics printed for them. Output is suppressed for
# commands executed within the line editor, including completion; commands explicitly marked with
# the time keyword still cause the summary to be printed in this case.
REPORTTIME=3

# This prompt is displayed on the right-hand side of the screen when the primary prompt is being
# displayed on the left.
RPROMPT="%T"

# Remove any right prompt from display when accepting a command line.
setopt transient_rprompt

# Executed before each prompt.
function precmd () {
    # local DEFAULT=$'%{\e[1;0m%}'
    local RESET="%{${reset_color}%}"
    # local GREEN="%{${fg[green]}%}"
    local BLUE="%{${fg[blue]}%}"
    local RED="%{${fg[red]}%}"
    local CYAN="%{${fg[cyan]}%}"
    local YELLOW="%{${fg[yellow]}%}"
    # local WHITE="%{${fg[white]}%}"
    # local GRAY="%{${fg[gray]}%}"
    # local BOLD_GREEN="%{${fg_bold[green]}%}"
    # local BOLD_BLUE="%{${fg_bold[blue]}%}"
    local BOLD_RED="%{${fg_bold[red]}%}"
    # local BOLD_CYAN="%{${fg_bold[cyan]}%}"
    # local BOLD_YELLOW="%{${fg_bold[yellow]}%}"
    # local BOLD_WHITE="%{${fg_bold[white]}%}"
    # local BOLD_GRAY="%{${fg_bold[gray]}%}"

    local color
    PROMPT="⚡️ ${YELLOW} %~${RESET} "
    st=`command git status 2>/dev/null`
    if [ $? ] ; then
        if [[ -n `echo "$st" | grep "^nothing to"` ]] ; then
            color=$CYAN
        elif [[ -n `echo "$st" | grep "^nothing added"` ]] ; then
            color=$BLUE
        elif [[ -n `echo "$st" | grep "^# Untracked"` ]] ; then
            color=$BOLD_RED
        else
            color=$RED
        fi
        branch=$(git_current_branch)
        if [ $branch ] ; then
            PROMPT+="$color$branch%b${RESET} "
        fi
    fi
}
