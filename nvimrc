" Vim Plug
call plug#begin('~/.nvim/plugged')

" Plugins
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-fugitive'
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
Plug 'ajh17/VimCompletesMe'
Plug 'sheerun/vim-polyglot'

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

" Copy/Cat
set clipboard=unnamedplus

" Whitespaces
set listchars=tab:▸·,eol:¶,trail:·
set list

" Colors
let color = "true"
set t_Co=256
set gfn=MonoOne\ 14
colorscheme OceanicNext
set background=dark

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
autocmd FileType ruby,python,php,javascript,html,markdown,css,slim autocmd BufWritePre * :%s/\s\+$//e
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
  \   'readonly': '%{&filetype=="help"?"":&readonly?"⭤":""}',
  \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
  \   'fugitive': '⭠ %{exists("*fugitive#head")?fugitive#head():""}',
  \   'lineinfo': '⭡ %3l:%-2v'
  \ },
  \ 'component_visible_condition': {
  \   'readonly': '(&filetype!="help"&& &readonly)',
  \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
  \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
  \ },
  \ 'separator': { 'left': '⮀', 'right': '⮂' },
  \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
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

" Signify
let g:signify_vcs_list = [ 'git' ]
let g:signify_sign_color_inherit_from_linenr = 1
