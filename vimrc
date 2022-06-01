" vim: foldmethod=marker
" !!! Type :echo $MYVIMRC to reload vimrc file
" This must be first, because it changes other options as side effect
set nocompatible

"repositories {{{1
call plug#begin('~/.vim/plugged')
Plug 'Raimondi/delimitMate'
Plug 'airblade/vim-gitgutter'
Plug 'benekastah/neomake'
Plug 'bigbrozer/vim-nagios'
Plug 'bps/vim-textobj-python', { 'for': 'python' }
Plug 'cespare/vim-toml', { 'for': 'toml' }
Plug 'chrisbra/vim-diff-enhanced'
Plug 'christoomey/vim-system-copy'
Plug 'christoomey/vim-tmux-navigator'
Plug 'derekwyatt/vim-scala', { 'for': 'scala' }
Plug 'dhruvasagar/vim-table-mode'
Plug 'ekalinin/Dockerfile.vim'
Plug 'embear/vim-localvimrc'
Plug 'hashivim/vim-terraform'
Plug 'itchyny/lightline.vim'
Plug 'kana/vim-textobj-user', { 'for': 'python' }
Plug 'lifepillar/vim-solarized8'
Plug 'lsdr/monokai'
Plug 'machakann/vim-highlightedyank'
Plug 'martinda/Jenkinsfile-vim-syntax'
Plug 'nanotech/jellybeans.vim'
Plug 'othree/xml.vim'
Plug 'tfnico/vim-gradle'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch' | Plug 'radenling/vim-dispatch-neovim'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive' ", { 'commit': 'b7287bd5421da62986d9abf9131509b2c9f918e4' }
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'vim-pandoc/vim-pandoc-syntax' | Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-python/python-syntax', { 'for': 'python' }
Plug 'vim-scripts/groovyindent-unix'
Plug 'vim-scripts/matchit.zip'

call plug#end()

"preferred editor setup {{{1
"properties {{{2
" set powerline Fonts
if has("gui_macvim")
    set guifont=Monaco\ for\ Powerline\:h11
else
    "set guifont=DejaVu\ Sans\ Mono 10
    "set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 10
    "set guifont=Droid\ Sans\ Mono\ for\ Powerline\ 10
    "set guifont=Liberation\ Mono\ for\ Powerline\,Literation\ Mono\ Powerline\ 10
    "set guifont=Anonymous\ Pro\ for\ Powerline\,Anonymice\ Powerline\ 12
    "set guifont=Inconsolata\ for\ Powerline\ 12
    "set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 12
endif

set tabstop=4
set softtabstop=4
set shiftwidth=4

set novisualbell                " turn off visualbell
set noerrorbells
set background=dark
set number                      " line numbers on
set showmatch                   " show matching brackets/parenthesis
set expandtab
set incsearch
set autoindent
set smartindent
set backspace=indent,eol,start  " backspace for dummies
set showmode
set ignorecase                  " case insensitive search
set smartcase                   " case sensitive when uc present
set incsearch                   " find as you type search
set hlsearch                    " highlight search terms
set autoread                    " auto reload changed files
set cursorline                  " mark cursor position
set laststatus=2                " always show status bar
set hidden                      " unsaved buffers are hidden now (no more errors when opening new file while having unsaved changes)
set mouse=a                     " enable scrolling
set shortmess+=c                " don't give |ins-completion-menu| messages
set nobackup
set nowritebackup
set path+=**                    " easier find (no **/ necessary)
set splitright                  " split on the right side of current pane
set splitbelow                  " split below from current pane

" 'smart' realtive line numbers
set relativenumber
autocmd InsertEnter * :set norelativenumber number
autocmd InsertLeave * :set relativenumber  number

filetype plugin on
filetype on
filetype indent on

" incremental highlighting for all matches
augroup vimrc-incsearch-highlight
  autocmd!
  autocmd CmdlineEnter [/\?] :set hlsearch
  autocmd CmdlineLeave [/\?] :set nohlsearch
augroup END

" set Vim-specific sequences for RGB colors
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

"color scheme
silent! colorscheme solarized8
syntax on

" auto completion adjustments
set completeopt=menuone,longest         " get rid of pop up preview

set pumheight=15                        " set pop up menu to have fixed length

" workaround to fix delay when entering insert mode with O
set timeout timeoutlen=1000 ttimeoutlen=100

" write all temporary files into one directory
set directory=$HOME/.cache/vim/swp/

" undo history
set undofile
set undodir=$HOME/.cache/vim/undo/

" faster screen redraw
set lazyredraw
set ttyfast

" retain screen position when switching the buffers
if v:version >= 700
  au BufLeave * let b:winview = winsaveview()
  au BufEnter * if(exists('b:winview')) | call winrestview(b:winview) | endif
endif

" automatically remove trailing whitespace characters on save
autocmd FileType c,cpp,python,vim,js autocmd BufWritePre <buffer> :%s/\s\+$//e

" tags location
set tags=./.tags,.tags,./tags,tags

" wildmenu {{{2
if has("wildmenu")
    set wildignore+=*.a,*.o,*.pyc
    set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png
    set wildignore+=*~,*.swp,*.tmp
    set wildmenu
    set wildmode=longest:full,full " command <Tab> completion, list matches, then longest common part, then all.
    set wildoptions+=pum
endif"}}}
" mappings {{{2
" set <Leader> to <space> instead of \
let mapleader=" "

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" remove trailing spaces
nmap _$ :%s/\v\s+$//e<CR>

" Set current working directory to current file
nnoremap <Leader>cd :cd %:p:h<CR>:pwd<CR>

" Set current working directory to git project root (requires fugitive)
nnoremap <Leader>cp :Glcd<CR>:pwd<CR>

" source current line or visual selection
vnoremap <Leader>S y:execute @@<CR>:echo 'Sourced selection.'<CR>
nnoremap <Leader>S ^vg_y:execute @@<CR>:echo 'Sourced line.'<CR>

" more vim-like behavior
nnoremap Y y$

" map jk to esc experimental
inoremap jk <Esc>

" Maps Alt-[h,j,k,l] to resizing a window split
map <silent> <A-h> <C-w>2<
map <silent> <A-j> <C-W>2-
map <silent> <A-k> <C-W>2+
map <silent> <A-l> <C-w>2>

" numbered search results for easier navigation
nnoremap // :g//#<Left><Left>

" use rg or ag instead of grep
if executable("rg")
  set grepprg=rg\ --vimgrep\ --no-heading
  set grepformat=%f:%l:%c:%m,%f:%l:%m
elseif executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

" file opening through partial matching (nested in directories or over path)
nnoremap ;e :e **/*
nnoremap ;f :find **/*
cmap eE e **/*
cmap fF find **/*

"plugin settings {{{1
"xml {{{2
let xml_use_xhtml = 1           " enable plugin when editing html files
"delimitMate {{{2
let b:delimitMate_expand_space = 1
let b:delimitMate_expand_cr = 2
au FileType htm,html let b:delimitMate_matchpairs = '(:),[:],{:}'
au FileType vim let b:delimitMate_quotes = "'"
"{{{ unimpaired
" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv
"lightline {{{2
set showtabline=2
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'gitbranch', 'filename' ] ],
      \   'right': [ [ 'lineinfo', 'cocstatus'],
      \            [ 'percent'],
      \            [ 'obsession', 'fileformat', 'fileencoding'],
      \            [ 'gutentags'] ],
      \ },
      \ 'component_function': {
      \   'filename': 'LightLineFilename',
      \   'obsession': 'LightlineObsession',
      \   'gitbranch': 'FugitiveHead',
      \   'cocstatus': 'coc#status',
      \   'gutentags': 'gutentags#statusline',
      \ },
      \ 'component_expand': {
      \   'buffers': 'lightline#bufferline#buffers',
      \   'obsession': 'LightlineObsession'
      \ },
      \ 'component_type': {
      \   'buffers': 'tabsel'
      \ },
      \ 'tabline': {
      \   'left': [['buffers']],
      \   'right': [['close']]
      \ },
      \ 'subseparator': { 'left': '|', 'right': '|' }
      \ }

function! LightLineFilename()
  return expand('%')
endfunction

function! LightlineObsession()
    return '%{ObsessionStatus()}'
endfunction
"tmux-navigator {{{2
augroup navigator
  autocmd!
  autocmd FileType netrw call s:reset_netrw_keys()
augroup END

function! s:reset_netrw_keys() abort
  nmap <buffer> <silent> <C-h> <Plug>NetrwHideEdit
  nmap <buffer> <silent> <C-l> <Plug>NetrwRefresh
endfunction

let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-h> :TmuxNavigateLeft<CR>
nnoremap <silent> <C-j> :TmuxNavigateDown<CR>
nnoremap <silent> <C-k> :TmuxNavigateUp<CR>
nnoremap <silent> <C-l> :TmuxNavigateRight<CR>

" solarized {{{2
silent! call togglebg#map("<F10>")
" local-vimrc {{{2
let g:localvimrc_ask = 0
let g:localvimrc_sandbox = 0
" Neomake {{{2
autocmd! BufWritePost * Neomake
let g:neomake_error_sign = {
    \ 'text': '✗',
    \ }
let g:neomake_warning_sign = {
    \ 'text': '⚠',
    \ }
" pandoc {{{2
let g:pandoc#folding#fdc = 0
let g:pandoc#spell#default_langs = ['en', 'pl']
let g:pandoc#syntax#codeblocks#embeds#langs = ['java', 'python', 'bash=sh', 'sql', 'groovy']
" TagBar {{{2
nnoremap <silent> <F9> :TagbarToggle<CR>
" highlightedyank {{{2
map y <Plug>(highlightedyank)
let g:highlightedyank_highlight_duration = 150
" nertw {{{2
let g:netrw_liststyle = 3
let g:netrw_localrmdir='rm -r'
" scripts {{{1
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction
