" vim: foldmethod=marker
" !!! Type :echo $MYVIMRC to reload vimrc file
" This must be first, because it changes other options as side effect
set nocompatible

"repositories {{{1
call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'asenac/vim-opengrok'
Plug 'benekastah/neomake'
Plug 'christoomey/vim-tmux-navigator'
Plug 'derekwyatt/vim-scala', { 'for': 'scala' }
Plug 'embear/vim-localvimrc'
Plug 'honza/dockerfile.vim'
Plug 'jwhitley/vim-colors-solarized'
Plug 'kana/vim-textobj-user' | Plug 'bps/vim-textobj-python'
Plug 'lsdr/monokai'
Plug 'majutsushi/tagbar'
Plug 'mattn/emmet-vim'
Plug 'othree/xml.vim'
Plug 'pgdouyon/vim-evanesco'
Plug 'Raimondi/delimitMate'
Plug 'rodjek/vim-puppet'
Plug 'ryanoasis/vim-devicons'
Plug 'Shougo/unite.vim' | Plug 'Shougo/unite-outline'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'tfnico/vim-gradle'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
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
set relativenumber              " relative line numbers
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

filetype plugin on
filetype on
filetype indent on

"color scheme
colorscheme solarized
syntax on

" auto completion adjustments
set completeopt=menuone,longest         " get rid of pop up preview

set pumheight=15                        " set pop up menu to have fixed length
" workaround to fix delay when entering insert mode with O
set timeout timeoutlen=1000 ttimeoutlen=100

" write all temporary files into one directory
set directory=$HOME/.vim/swp//

" faster macro execution
set lazyredraw

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
" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" remove trailing spaces
nmap _$ :%s/\v\s+$//e<CR>

" Set current working directory to current file
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>

" Set current working directory to git project root (requires fugitive)
nnoremap ,cp :Glcd<CR>:pwd<CR>

" copy paste mappings
vnoremap <C-Insert> "+y
map <S-Insert> "+gP

" set <leader> to , instead of \
let mapleader=","

" source current line or visual selection
vnoremap <leader>S y:execute @@<cr>:echo 'Sourced selection.'<cr>
nnoremap <leader>S ^vg_y:execute @@<cr>:echo 'Sourced line.'<cr>

" more vim-like behavior
nnoremap Y y$

" map jk to esc experimental
inoremap jk <Esc>

" Maps Alt-[h,j,k,l] to resizing a window split
map <silent> <A-h> <C-w>2<
map <silent> <A-j> <C-W>2-
map <silent> <A-k> <C-W>2+
map <silent> <A-l> <C-w>2>

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
let g:UltiSnipsSnippetsDir='~/.vim/customized_snippets'
let g:UltiSnipsSnippetDirectories=["customized_snippets", "bundle/vim-snippets/UltiSnips"]

let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

let g:ultisnips_python_quoting_style="single"
let g:ultisnips_python_style="sphinx"
"Unite {{{2
let g:unite_source_rec_max_cache_files = 2000
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
call unite#custom#source('buffer,file,file_rec', 'sorters', 'sorter_selecta')

nnoremap <leader>t :<C-u>Unite -no-split -buffer-name=files   -start-insert -no-resize file_rec/async<cr>
nnoremap <leader>f :<C-u>Unite -no-split -buffer-name=files   -auto-preview -start-insert -no-resize file<cr>
nnoremap <leader>n :<C-u>Unite -no-split -buffer-name=notes   -start-insert -no-resize file_rec:$NOTES<cr>
nnoremap <leader>o :<C-u>Unite -no-split -buffer-name=outline -start-insert -no-resize outline<cr>
nnoremap <leader>e :<C-u>Unite -no-split -buffer-name=files -start-insert -no-resize buffer<cr>
nnoremap <leader>s :<C-u>Unite grep:.<cr>

"hack for removing unite buffers form jumplist (UniteResume) doesn't work because of that"
autocmd BufLeave \[unite\]* if "nofile" ==# &buftype | setlocal bufhidden=wipe | endif

if executable('ag')
  let g:unite_source_rec_async_command =
    \ ['ag', '-p ~/.config/.agignore', '--follow', '--nocolor', '--nogroup',
    \  '--hidden', '-g', '']
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts =
    \ '-i --vimgrep --hidden --ignore ' .
    \ '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
  let g:unite_source_grep_recursive_opt = ''
  let g:unite_source_grep_max_candidates = 10000

  set grepprg=ag\ --vimgrep\ $*
  set grepformat=%f:%l:%c:%m
endif

" speed up recursive file searching
"if executable('ack')
"    let g:unite_source_rec_async_command = 'ack -f --nofilter'
"    let g:unite_source_grep_command = 'ack'
"    let g:unite_source_grep_default_opts = '--no-color --no-heading'
"    let g:unite_source_grep_recursive_opt = ''
"endif
"airline {{{2
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1
"tmux-navigator {{{2
augroup navigator
  autocmd!
  autocmd FileType netrw call s:reset_netrw_keys()
augroup END

function! s:reset_netrw_keys() abort
  nmap <buffer> <silent> <c-h> <Plug>NetrwHideEdit
  nmap <buffer> <silent> <c-l> <Plug>NetrwRefresh
endfunction

let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
" TagBar {{{2
nnoremap <silent> <F9> :TagbarToggle<CR>
" solarized {{{2
call togglebg#map("<F10>")
" YouCompleteMe {{{2
let g:ycm_filetype_blacklist = {
    \ 'tagbar' : 1,
    \ 'qf' : 1,
    \ 'unite' : 1,
    \}
let g:ycm_auto_trigger = 1
let g:ycm_key_detailed_diagnostics = '' " disable default mapping
let g:ycm_key_list_previous_completion = ['<S-TAB>']
nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
" syntastic {{{2
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_style_error_symbol = '⚠'
let g:syntastic_style_warning_symbol = '⚠'
let g:syntastic_aggregate_errors = 1
let g:syntastic_tex_checkers = ['chktex']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" local-vimrc {{{2
let g:localvimrc_ask = 0
let g:localvimrc_sandbox = 0
" pandoc {{{2
let g:pandoc#folding#fdc = 0
let g:pandoc#spell#enabled = 0
" opengrok {{{2
let g:opengrok_jar = '/opt/opengrok/lib/opengrok.jar'
let g:opengrok_ctags = '/usr/local/bin/ctags'

nnoremap <leader>d :OgSearch d<CR><CR>
nnoremap <leader>r :OgSearch r<CR><CR>
nnoremap <leader>p :OgSearch p<CR><CR>
" netrw {{{2
let g:netrw_liststyle = 3
