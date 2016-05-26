autoload -U colors
REPORTTIME=3
colors

# Color
local DEFAULT=$'%{\e[1;0m%}'
local RESET="%{${reset_color}%}"
local GREEN="%{${fg[green]}%}"
local BLUE="%{${fg[blue]}%}"
local RED="%{${fg[red]}%}"
local CYAN="%{${fg[cyan]}%}"
local YELLOW="%{${fg[yellow]}%}"
local WHITE="%{${fg[white]}%}"
local GRAY="%{${fg[gray]}%}"
local BOLD_GREEN="%{${fg_bold[green]}%}"
local BOLD_BLUE="%{${fg_bold[blue]}%}"
local BOLD_RED="%{${fg_bold[red]}%}"
local BOLD_CYAN="%{${fg_bold[cyan]}%}"
local BOLD_YELLOW="%{${fg_bold[yellow]}%}"
local BOLD_WHITE="%{${fg_bold[white]}%}"
local BOLD_GRAY="%{${fg_bold[gray]}%}"

RPROMPT="%T"

setopt transient_rprompt

function precmd () {
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
