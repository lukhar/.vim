" vim: foldmethod=marker
" !!! Type :echo $MYVIMRC to reload vimrc file
" This must be first, because it changes other options as side effect
set nocompatible

"repositories {{{1
call plug#begin('~/.vim/plugged')
Plug 'Raimondi/delimitMate'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'airblade/vim-gitgutter'
Plug 'benekastah/neomake'
Plug 'bigbrozer/vim-nagios'
Plug 'chrisbra/vim-diff-enhanced'
Plug 'christoomey/vim-system-copy'
Plug 'christoomey/vim-tmux-navigator'
Plug 'derekwyatt/vim-scala', { 'for': 'scala' }
Plug 'dhruvasagar/vim-table-mode'
Plug 'ekalinin/Dockerfile.vim'
Plug 'embear/vim-localvimrc'
Plug 'hashivim/vim-terraform'
Plug 'itchyny/lightline.vim' | Plug 'mengelbrecht/lightline-bufferline'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-slash'
Plug 'justinmk/vim-dirvish'
Plug 'kana/vim-textobj-user' | Plug 'bps/vim-textobj-python'
Plug 'lifepillar/vim-solarized8'
Plug 'lsdr/monokai'
Plug 'ludovicchabant/vim-gutentags'
Plug 'machakann/vim-highlightedyank'
Plug 'majutsushi/tagbar'
Plug 'mattn/emmet-vim'
Plug 'nanotech/jellybeans.vim'
Plug 'othree/xml.vim'
Plug 'rodjek/vim-puppet'
Plug 'tfnico/vim-gradle'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-dispatch' | Plug 'radenling/vim-dispatch-neovim'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-pandoc/vim-pandoc-syntax' | Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-scripts/matchit.zip'
Plug 'xolox/vim-misc' | Plug 'xolox/vim-reload'
call plug#end()

"preferred editor setup {{{1
"properties {{{2
" set powerline Fonts
if has("gui_macvim")
    set guifont=Monaco\ for\ Powerline\:h11
else
    "set guifont=DejaVu\ Sans\ Mono\ 10
    set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 10
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
endif"}}}
" mappings {{{2
" set <Leader> to <space> instead of \
let mapleader=" "

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" open file in the same dir
cmap ew e <C-R>=expand("%:p:h") . "/" <CR>

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

" use ag instaed of grep
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
endif

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
"UltiSnips  {{{2
let g:UltiSnipsSnippetDirectories=["customized_snippets", "bundle/vim-snippets/UltiSnips"]

let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

let g:ultisnips_python_quoting_style="single"
let g:ultisnips_python_style="sphinx"
"fzf {{{2
if executable('ag')
    let $FZF_DEFAULT_COMMAND = 'ag -g ""'
endif

"let g:fzf_layout = { 'up': '~40%' }
nnoremap <Leader>r :GFiles<CR>
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>n :Files $NOTES<CR>
nnoremap <Leader>e :Tags<CR>
nnoremap <Leader>w :Windows<CR>
nnoremap <Leader>E :BTags<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>s :Ag<space>
"lightline {{{2
set showtabline=2
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'gitbranch', 'filename' ] ],
      \   'right': [ [ 'lineinfo', 'cocstatus'],
      \            [ 'percent'],
      \            [ 'obsession', 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'component_function': {
      \   'filename': 'LightLineFilename',
      \   'obsession': 'LightlineObsession',
      \   'gitbranch': 'fugitive#head',
      \ },
      \ 'component_expand': {
      \   'buffers': 'lightline#bufferline#buffers',
      \   'obsession': 'LightlineObsession',
      \ },
      \ 'subseparator': { 'left': '|', 'right': '|' }
      \ }
let g:lightline.tabline          = {'left': [['buffers']], 'right': [['close']]}
let g:lightline.component_type   = {'buffers': 'tabsel'}

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
" YouCompleteMe {{{2
let g:ycm_filetype_blacklist = {
    \ 'tagbar' : 1,
    \ 'qf' : 1,
    \ 'unite' : 1,
    \}
let g:ycm_auto_trigger = 1
let g:ycm_key_detailed_diagnostics = '' " disable default mapping
let g:ycm_key_list_previous_completion = ['<S-TAB>']
nnoremap <Leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
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
" gutentags {{{2
let g:gutentags_define_advanced_commands = 1
let g:gutentags_enabled = 0
let g:gutentags_cache_dir = '~/.cache/gutentags'
" highlightedyank {{{2
map y <Plug>(highlightedyank)
let g:highlightedyank_highlight_duration = 150
" scripts {{{1
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction
