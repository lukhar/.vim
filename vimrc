" vim: foldmethod=marker
" !!! Type :echo $MYVIMRC to reload vimrc file
" This must be first, because it changes other options as side effect
set nocompatible

"NeoBundle initialization {{{1
set runtimepath+=~/.vim/bundle/neobundle.vim/
call neobundle#rc(expand('~/.vim/bundle/'))
"Repositories {{{1
" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Recommended to install
" after install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f our_machines_makefile
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }

NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'bling/vim-airline'
NeoBundle 'christoomey/vim-tmux-navigator'
NeoBundle 'davidhalter/jedi-vim'                    " python auto completion
NeoBundle 'h1mesuke/unite-outline'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'vim-scripts/matchit.zip'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'othree/xml.vim'
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'SirVer/ultisnips'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'tpope/vim-abolish'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'terryma/vim-expand-region'
NeoBundle 'terryma/vim-multiple-cursors'
"NeoBundle 'Valloric/YouCompleteMe'                  " autocompletion for anything else
"NeoBundle 'xolox/vim-easytags'                     " automatic tags generation
NeoBundle 'xolox/vim-misc'                          " needed by vim-reload
NeoBundle 'xolox/vim-reload'                        " automatically reloads edited vim scripts
NeoBundle 'xolox/vim-notes'
NeoBundle 'edkolev/tmuxline.vim'
NeoBundle 'ervandew/supertab'
NeoBundle 'scrooloose/syntastic'


NeoBundleCheck
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
set scrolljump=5                " lines to scroll when cursor leaves screen
set scrolloff=3                 " minimum lines to keep above and below cursor
set ignorecase                  " case insensitive search
set smartcase                   " case sensitive when uc present
set incsearch                   " find as you type search
set hlsearch                    " highlight search terms
set autoread                    " auto reload changed files
set cursorline                  " mark cursor position
set laststatus=2                " always show status bar

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
set directory=$HOME/.vim/swp

" faster macro execution
set lazyredraw

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
nmap _$ :%s/\s+$//e<CR>
" use very magic in search/replace
nnoremap / /\v
cnoremap %s/ %s/\v
"plugin settings {{{1
"xml {{{2
let xml_use_xhtml = 1           " enable plugin when editing html files
"delimitMate {{{2
let b:delimitMate_expand_space = 1
let b:delimitMate_expand_cr = 1
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
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsSnippetDirectories=["snippets"]
"easytags {{{2
"let g:easytags_updatetime_warn=0  "silence warning about to low update value
"key mappings {{{2
"This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>
"Set current working directory to current file
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>
" copy paste mappings
vnoremap <C-Insert> "+y
map <S-Insert> "+gP
" set <leader> to , instead of \
let mapleader=","
"Unite {{{2
let g:unite_source_history_yank_enable = 1
let g:unite_source_rec_max_cache_files = 2000

nnoremap <leader>t :<C-u>Unite -no-split -buffer-name=files   -start-insert file_rec/async:!<cr>
nnoremap <leader>f :<C-u>Unite -no-split -buffer-name=files   -auto-preview   -start-insert file<cr>
nnoremap <leader>h :<C-u>Unite -no-split -buffer-name=mru     -start-insert file_mru<cr>
nnoremap <leader>o :<C-u>Unite -no-split -buffer-name=outline -start-insert outline<cr>
nnoremap <leader>y :<C-u>Unite -no-split -buffer-name=yank history/yank<cr>
nnoremap <leader>e :<C-u>Unite -no-split -buffer-name=files -start-insert buffer<cr>
nnoremap <leader>s :<C-u>Unite grep:.<cr>

"hack for removing unite buffers form jumplist (UniteResume) doesn't work because of that"
autocmd BufLeave \[unite\]* if "nofile" ==# &buftype | setlocal bufhidden=wipe | endif

" disabled ag because it ignores files it should display for some reason...
if executable('ag')
  let g:unite_source_rec_async_command= 'ag -l .'
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--smart-case --nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif

" speed up recursive file searching
"if executable('ack')
"    let g:unite_source_rec_async_command = 'ack -f --nofilter'
"    let g:unite_source_grep_command = 'ack'
"    let g:unite_source_grep_default_opts = '--no-color --no-heading'
"    let g:unite_source_grep_recursive_opt = ''
"endif
"YouCompleteMe {{{2
"let g:ycm_autoclose_preview_window_after_completion=1
"nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
"airline {{{2
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1
"tmux-navigator {{{2
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
" jedi{{{2
let g:jedi#show_call_signatures = 0
let g:jedi#auto_vim_configuration = 0   " disable vim auto configuration
let g:jedi#use_tabs_not_buffers = 0     " do go to in buffers
let g:jedi#popup_on_dot = 1             " auto popup completion
let g:jedi#popup_select_first = 1
" NERDTree {{{2
nnoremap <silent> <F1> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$'] " ignore .pyc files
" TagBar {{{2
nnoremap <silent> <F9> :TagbarToggle<CR>
" solarized {{{2
call togglebg#map("<F10>")
" notes {{{2
let g:notes_directories = ['~/Documents/Notes']
let g:notes_suffix = '.note'
" YouCompleteMe {{{2
let g:ycm_filetype_blacklist = {
    \ 'tagbar' : 1,
    \ 'qf' : 1,
    \ 'notes' : 1,
    \ 'markdown' : 1,
    \ 'unite' : 1,
    \ 'text' : 1,
    \ 'vimwiki' : 1,
    \ 'pandoc' : 1,
    \ 'python' : 1
    \}
" syntastic {{{2
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_style_error_symbol = '☹'
let g:syntastic_style_warning_symbol = '☹'
let g:syntastic_python_checkers = ['pylint', 'pep8']
let g:syntastic_aggregate_errors = 1

autocmd FileType python nnoremap <buffer> <F12> :SyntasticCheck<CR>
" SuperTab {{{2
let g:SuperTabLongestHighlight = 0
let g:SuperTabDefaultCompletionType = "context"
