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

" ----------------------------------------------------------------------------------------
"   neobundle
" ----------------------------------------------------------------------------------------
filetype off
if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Recommended to install
" After install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile
NeoBundle 'Shougo/vimproc', {
        \ 'build' : {
                \ 'windows' : 'make -f make_mingw32.mak',
                \ 'cygwin' : 'make -f make_cygwin.mak',
                \ 'mac' : 'make -f make_mac.mak',
                \ 'unix' : 'make -f make_unix.mak',
        \ },
\ }

if has('lua')
    NeoBundle 'Shougo/neocomplete' " {{{
    
    " Use neocomplete.
    let g:neocomplete#enable_at_startup = 1
    " Use smartcase.
    let g:neocomplete#enable_smart_case = 1
    " Use camel case completion.
    let g:neocomplete#enable_camel_case = 1
    " Supress some errors.
    let g:neocomplete#force_overwrite_completefunc = 1
    " Set minimum syntax keyword length.
    let g:neocomplete#sources#syntax#min_keyword_length = 3
    let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
    " The number of candidates displayed in a pop-up menu.
    let g:neocomplete#max_list = 10

    " Define dictionary.
    let g:neocomplete#sources#dictionary#dictionaries = {
                \ 'default'    : '',
                \ 'perl'       : $HOME.'/.vim/dict/perl.dict',
                \ 'javascript' : $HOME.'/.vim/dict/javascript.dict',
                \ 'coffee'     : $HOME.'/.vim/dict/javascript.dict',
                \ 'gitcommit'  : $HOME.'/.vim/dict/gitcommit.dict'
                \ }

    " Define keyword.
    if !exists('g:neocomplete_keyword_patterns')
        let g:neocomplete#keyword_patterns = {}
    endif
    let g:neocomplete#keyword_patterns['default'] = '\h\w*'

    " Plugin key-mappings.
    inoremap <expr><C-g>  neocomplete#undo_completion()
    "inoremap <expr><C-l>  neobundle#complete_common_string()

    " Recommended key-mappings.
    " <CR>: close popup and save indent.
    inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
    function! s:my_cr_function()
        return neocomplete#smart_close_popup() . "\<CR>"
        " For no inserting <CR> key.
        "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
    endfunction
    " <TAB>: compleion.
    inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
    " <C-h>, <BS>: close popup and delete backword char.
    inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
    inoremap <expr><BS>  neocomplete#smart_close_popup()."\<C-h>"
    inoremap <expr><C-y> neocomplete#close_popup()
    inoremap <expr><C-e> neocomplete#cancel_popup()
    " <Space>: close popup.
    "inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

    " Enable omni completion.
    augroup OmniCompletion
        autocmd!
        autocmd FileType css
              \ setlocal omnifunc=csscomplete#CompleteCSS
        autocmd FileType html,markdown
              \ setlocal omnifunc=htmlcomplete#CompleteTags
        autocmd FileType javascript
              \ setlocal omnifunc=javascriptcomplete#CompleteJS
        autocmd FileType python
              \ setlocal omnifunc=pythoncomplete#Complete
        autocmd FileType xml
              \ setlocal omnifunc=xmlcomplete#CompleteTags
    augroup END
    " }}}

    " NeoBundle 'Shougo/neosnippet'
else
    NeoBundle 'Shougo/neocomplcache'
endif


NeoBundle 'Shougo/vimfiler', {'depends': 'Shougo/unite.vim'} " {{{
" Use vimfiler as file manager instead of netrw.
let g:vimfiler_as_default_explorer = 1
" Edit file by tabedit.
"let g:vimfiler_edit_action = 'tabopen'
" Enable file operation commands.
"let g:vimfiler_safe_mode_by_default = 0
" Use with powerline
let g:vimfiler_force_overwrite_statusline = 0
let g:vimfiler_min_filename_width = 30
let g:vimfiler_max_filename_width = 120

nnoremap <silent><Space>e :<C-u>VimFilerCurrentDir -explorer -find -split 
      \ -simple -winwidth=30 -toggle -no-quit<CR>

augroup VimFilerSettings
    autocmd!
    autocmd FileType vimfiler nmap <buffer> <2-LeftMouse>
          \ <Plug>(vimfiler_edit_file)
    " Starts VimFiler automatically if no files were specified.
    if !argc()
        autocmd VimEnter * VimFiler -status
    endif
augroup END
" }}}

" NeoBundle 'thinca/vim-quickrun'
" NeoBundle 'davidoc/taskpaper.vim'
" NeoBundle 'altercation/vim-colors-solarized'

NeoBundle 'scrooloose/syntastic'
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_ruby_rubocop_args = '--rails'
let g:syntastic_scss_checkers = ['scss_lint']
let g:syntastic_coffee_checkers = ['coffeelint']
let g:syntastic_coffee_coffeelint_args = '-f .coffeelint.json'
let g:syntastic_check_on_open = 1
let g:syntastic_auto_jump = 1


NeoBundle 'surround.vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundleLazy 'briancollins/vim-jst', {
            \ 'autoload': {'filetypes': ['jst', 'ejs']},
            \ 'depends': 'pangloss/vim-javascript'
            \ }
NeoBundle 'tpope/vim-unimpaired'
" Ggrep後に自動的にquickfix windowを開く
augroup Search
    autocmd!
    autocmd QuickFixCmdPost *grep cwindow
augroup END

NeoBundle 'chriskempson/base16-vim'
colorscheme base16-default
set background=dark
augroup Hack
    au!
    " 何故かbackground=darkなのにlightなテーマが表示される問題を回避する
    au VimEnter * source $HOME/.vimrc
augroup END

NeoBundle 'itchyny/lightline.vim' " {{{
let g:lightline = {
            \ 'colorscheme': 'wombat',
            \ 'mode_map': {'c': 'NORMAL'},
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
            \ },
            \ 'component_function': {
            \   'modified': 'MyModified',
            \   'readonly': 'MyReadonly',
            \   'fugitive': 'MyFugitive',
            \   'filename': 'MyFilename',
            \   'fileformat': 'MyFileformat',
            \   'filetype': 'MyFiletype',
            \   'fileencoding': 'MyFileencoding',
            \   'mode': 'MyMode'
            \ }
            \ }

function! MyModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'x' : ''
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
            \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
            \  &ft == 'unite' ? unite#get_status_string() :
            \  &ft == 'vimshell' ? vimshell#get_status_string() :
            \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
            \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
  try
    if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
      return fugitive#head()
    endif
  catch
  endtry
  return ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction
" }}}
NeoBundle 'slim-template/vim-slim'
NeoBundle 'YankRing.vim'
noremap <C-y> :YRShow<CR>

filetype plugin indent on     " Required!

" Installation check.
NeoBundleCheck
