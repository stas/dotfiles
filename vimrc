" Vim Plug
call plug#begin('~/.vim/plugged')

" Plugins
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'godlygeek/tabular'
Plug 'mhinz/vim-startify'
Plug 'roman/golden-ratio'
Plug 'kien/ctrlp.vim'
Plug 'mhartington/oceanic-next'
Plug 'altercation/vim-colors-solarized'
Plug 'Raimondi/delimitMate'
Plug 'mhinz/vim-signify'
Plug 'Yggdroot/indentLine'
Plug 'mileszs/ack.vim'
Plug 'gmarik/sudo-gui.vim'
Plug 'itchyny/lightline.vim'
Plug 'benekastah/neomake'
Plug 'ervandew/supertab'
Plug 'sheerun/vim-polyglot'
Plug 'klen/python-mode'
Plug 'vim-ruby/vim-ruby'
Plug 'morhetz/gruvbox'

call plug#end()

" Misc
set nu
set ruler
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
set cc=80
set scrolloff=5
set noeol
set cursorline
set noswapfile
set nobackup

set expandtab
set autoindent
set tabstop=2 shiftwidth=2 softtabstop=2

" Copy/Cat
set clipboard=unnamedplus

" Remove any preview windows
set completeopt-=preview

" Whitespaces
set listchars=tab:▸·,eol:¶,trail:·
set list

" Colors
let color="true"
set t_Co=256
set gfn=Mononoki\ 14
" colorscheme solarized
set background=light

if has("gui_running")
  set guioptions-=m
  set guioptions-=T
  set guioptions-=r
  set guioptions-=R
  set guioptions-=l
  set guioptions-=L
  colorscheme gruvbox
else
  set background=dark
endif

" Keyboard maps
nmap <space> :
nmap <leader>e :vsp
nmap <leader>q :bd<CR>
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

" netrw
let g:netrw_altv            = 1
let g:netrw_fastbrowse      = 1
let g:netrw_keepdir         = 0
let g:netrw_liststyle       = 0
let g:netrw_retmap          = 1
let g:netrw_silent          = 1
let g:netrw_use_errorwindow = 0
let netrw_list_hide         = '^\(\..\{-}\.sw.\|.\{-}\.pyc\)$'

" Files
autocmd! BufWritePost * Neomake
" Remove whitespaces on save
autocmd FileType * autocmd BufWritePre * :%s/\s\+$//e
" More file types
autocmd BufNewFile,BufRead *.sls set filetype=yaml
autocmd BufNewFile,BufRead *.embl set filetype=emblem
" Enable Spell Checking for markdown files
autocmd BufRead,BufNewFile *.md setlocal spell
autocmd BufRead,BufNewFile *.markdown setlocal spell
autocmd BufRead,BufNewFile *.rst setlocal spell

" Status line
let g:lightline = {
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
  \ },
  \ 'component': {
  \   'readonly': '%{&filetype=="help"?"":&readonly?"":""}',
  \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
  \   'fugitive': ' %{exists("*fugitive#head")?fugitive#head():""}',
  \   'lineinfo': ' %3l:%-2v'
  \ },
  \ 'component_visible_condition': {
  \   'readonly': '(&filetype!="help"&& &readonly)',
  \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
  \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
  \ },
  \ 'separator': { 'left': '', 'right': '' },
  \ 'subseparator': { 'left': '', 'right': '' }
  \ }

" CtrlP Stuff
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_match_window_reversed = 1
let g:ctrlp_open_new_file = 3
let g:ctrlp_use_caching = 0
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|bzr)$|coverage|tmp\/cache',
  \ }
let g:ctrlp_user_command = [
  \ '.git', 'cd %s && git ls-files . -co --exclude-standard',
  \ 'find %s -type f'
  \ ]

" SuperTab
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SuperTabCrMapping = 1

" Signify
let g:signify_vcs_list = [ 'git' ]
let g:signify_sign_color_inherit_from_linenr = 1

" Python Mode
let g:pymode_folding = 0
let g:pymode_motion = 0
let g:pymode_lint_cwindow = 0
let g:pymode_rope = 0
let g:pymode_rope_completion = 0

" Commentary
xmap \\  <Plug>Commentary<CR>
nmap \\  <CR><Plug>Commentary
