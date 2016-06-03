let s:blacklist = ['gitcommit', 'gitrebase']
let s:min_width = 120

augroup MyNerdtreeSettings
  autocmd!
  autocmd VimEnter * if index(s:blacklist, &ft) < 0 && winwidth(0) >= s:min_width | NERDTree | endif
  autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
augroup END
