let color = "true"
set sh=/bin/bash
set encoding=utf-8
set background=dark
set backspace=indent,eol,start
set expandtab
set ignorecase
set incsearch
set matchpairs=(:),{:},[:],<:>
set nobackup
set nocompatible
set nohlsearch
set nostartofline
set nowritebackup
set number
set nobackup
set nowb
set noswapfile
"set paste
set ruler
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
set cc=80
set scrolloff=5
set showcmd
set showmatch
set showmode
set smartindent
set smartcase
set tabstop=2 shiftwidth=2 softtabstop=2
set whichwrap=b,s,h,l,<,>,[,]
set laststatus=2
set hidden
set foldmethod=syntax
set nofoldenable
set wildmenu
set ttyfast
set noeol
set cursorline
syntax on
hi Comment ctermfg=darkgrey
filetype off
set gfn=Inconsolata\ 11.5
set shortmess+=filmnrxoOtT
set viewoptions=folds,options,cursor,unix,slash
set virtualedit=onemore
set history=1000
set spell
set linespace=0

" Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage bundles
" required!
Bundle 'gmarik/vundle'

" More bundles
Bundle 'tpope/vim-fugitive'
Bundle 'kien/ctrlp.vim'
Bundle 'vim-ruby/vim-ruby'
Bundle 'scrooloose/syntastic'
Bundle 'Lokaltog/vim-powerline'
Bundle 'pangloss/vim-javascript'
Bundle 'kana/vim-smartinput'
Bundle 'mileszs/ack.vim'
Bundle 'tpope/vim-commentary'
Bundle 'Shougo/neocomplcache'
Bundle 'altercation/vim-colors-solarized'

filetype plugin indent on

if has("gui_running")
  set guioptions-=m
  set guioptions-=T
  set t_Co=256

  colorscheme solarized
  let g:solarized_termcolors=256
  let g:solarized_termtrans=1
  let g:solarized_contrast="high"
  let g:solarized_visibility="high"

  set background=light
  set listchars=tab:▸·,eol:¶,trail:·
  set list
endif

" Keyboard maps
nmap <space> :
nmap <leader>e :vsp 
nmap <leader>q :bd<CR>
nmap <leader>cd  :lcd%:p:h<CR>
nmap <leader>w :w<CR>

" Status line
let g:Powerline_symbols = 'fancy'
set statusline=%{SyntasticStatuslineFlag()}%F%m%r%h%w\%=%{fugitive#statusline()}\ [\%l,\%c\]\ A:\%b\ H:\x%B\ P:\%p%%

" Copy/Cat
set clipboard=unnamedplus

" CtrlP Stuff
let g:ctrlp_match_window_reversed = 1
let g:ctrlp_open_new_file = 3
let g:ctrlp_use_caching = 0
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\|\.bzr$\',
  \ }

" SuperTab stuff
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
let g:SuperTabDefaultCompletionType = "context"

" Enable omni completion.
set ofu=syntaxcomplete#Complete
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete

" Remove whitespaces on save
autocmd FileType ruby,python,php,javascript,html,markdown,css autocmd BufWritePre * :%s/\s\+$//e
