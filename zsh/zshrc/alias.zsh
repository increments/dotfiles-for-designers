setopt complete_aliases

alias ll='ls -l'
alias less='less -qR'

# extract function is defined in zfunctions/extract
alias -s {gz,tgz,zip,lzh,bz2,tbz,Z,tar,arj,xz}=extract

case ${OSTYPE} in
darwin*)
    alias ls='ls -GF'
    alias -s {png,jpg,bmp,PNG,JPG,BMP}='open -a Preview'
    ;;
linux*)
    alias ls='ls -F --color=auto'
    ;;
esac
