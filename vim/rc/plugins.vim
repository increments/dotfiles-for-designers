call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'chriskempson/base16-vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'itchyny/lightline.vim'
Plug 'othree/html5.vim', { 'for': 'html' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'scrooloose/nerdtree' | Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'scrooloose/syntastic'
Plug 'slim-template/vim-slim', { 'for': 'slim' }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'

if v:version < 704
  " scss-syntax.vim requires css.vim if vim version < 7.4
  Plug 'JulesWang/css.vim'
endif
Plug 'hail2u/vim-css3-syntax' " Add CSS3 syntax support to Vim's built-in syntax/css.vim.
Plug 'cakebaker/scss-syntax.vim'

" Add plugins to &runtimepath
call plug#end()

" Load all plugin settings
for file in split(glob($DOTFILES_ROOT . "/vim/rc/plugins/*.vim"), "\n")
  execute "source " . file
endfor
