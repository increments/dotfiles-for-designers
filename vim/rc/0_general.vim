set nocompatible               " Be iMproved

filetype plugin on
syntax on
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set laststatus=2
set number
set showcmd
set noswapfile
set nobackup
set noundofile
set whichwrap=b,s,h,l,<,>,[,]
set imdisable
set iminsert=0
set imsearch=-1
set foldmethod=marker
set hlsearch
" for command mode
nmap <S-Tab> <<
" for insert mode
imap <S-Tab> <Esc><<i
set list

set encoding=utf-8          " Use utf-8
set termencoding=utf-8      " ..
set fileencodings=utf-8     " ..
" Automatic end-of-file format detection
set fileformats=unix,mac,dos

if exists('&ambiwidth')
  set ambiwidth=double
endif
