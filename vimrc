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

" Disable arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" Status line
let g:Powerline_symbols = 'fancy'
set laststatus=2
set statusline=%<%f\    " Filename
set statusline+=%w%h%m%r " Options
set statusline+=%{SyntasticStatuslineFlag()} " Syntastic
set statusline+=%{fugitive#statusline()} "  Git Hotness
set statusline+=\ [%{&ff}/%Y]            " filetype
set statusline+=\ [%{getcwd()}]          " current dir
set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info

" Copy/Cat
set clipboard=unnamedplus

" CtrlP Stuff
let g:ctrlp_match_window_reversed = 1
let g:ctrlp_open_new_file = 3
let g:ctrlp_use_caching = 0
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\|\.bzr$\',
  \ }

" Enable omni completion.
" set ofu=syntaxcomplete#Complete
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete

" Neocomplcache
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_auto_delimiter = 1
let g:neocomplcache_max_list = 15
let g:neocomplcache_force_overwrite_completefunc = 1
let g:neocomplcache_disable_auto_complete = 1
" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'
" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
" Shortcuts
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<C-x>\<TAB>"

" Remove whitespaces on save
autocmd FileType ruby,python,php,javascript,html,markdown,css autocmd BufWritePre * :%s/\s\+$//e
