" !!! Type :echo $MYVIMRC to relod vimrc file
" This must be first, because it changes other options as side effect
set nocompatible

"{{{ NeoBundle initialization
set runtimepath+=~/.vim/bundle/neobundle.vim/
call neobundle#rc(expand('~/.vim/bundle/'))
"}}}

"{{{ Repositories
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
NeoBundle 'davidhalter/jedi-vim'
NeoBundle 'h1mesuke/unite-outline'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'marijnh/tern_for_vim'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'othree/xml.vim'
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'SirVer/ultisnips'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'tpope/vim-abolish'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'terryma/vim-expand-region'
"NeoBundle 'Valloric/YouCompleteMe'
NeoBundle 'xolox/vim-easytags'
NeoBundle 'xolox/vim-misc'
NeoBundle 'edkolev/tmuxline.vim'


NeoBundleCheck
"}}}

"{{{ preffered editor setup

" set powerline Fonts
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 9.5

set tabstop=4
set softtabstop=4
set shiftwidth=4

set novisualbell                " Turn off visualbell
set background=dark
set nu                          " Line numbers on
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
set wildmenu
set wildmode=longest:full,full " command <Tab> completion, list matches, then longest common part, then all.
set incsearch                   " find as you type search
set hlsearch                    " highlight search terms
set autoread                    " auto reaload changed files

filetype plugin on
filetype on
filetype indent on

"color sheme
colorscheme solarized

"fold method
set foldmethod=marker           " set symbols {{{,}}} as default fold marker

syntax on

" set autoremoving trailing whitespaces for selected filetypes
autocmd FileType c,cpp,python,vim autocmd BufWritePre <buffer> :%s/\s\+$//e

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %
"}}}

"{{{ xml
let xml_use_xhtml = 1           " enable plugin when editing html files
"}}}

"{{{ delimitMate
let b:delimitMate_expand_space = 1
let b:delimitMate_expand_cr = 1
au FileType htm,html let b:delimitMate_matchpairs = "(:),[:],{:}"
"}}}

"{{{ unimpaired
" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv
"}}}

"{{{ UltiSnips
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "snippets"]
"}}}

"{{{ easytags
let g:easytags_updatetime_warn=0  "silience warning about to low update value
"}}}

"{{{ key mappings

"This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>

"Set current working directory to current file
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>

" copy paste mappings
vnoremap <C-Insert> "+y
map <S-Insert> "+gP

" set <leader> to , instead of \
let mapleader=","
"}}}

"{{{ Unite
let g:unite_source_history_yank_enable = 1
let g:unite_source_rec_max_cache_files = 2000

call unite#filters#matcher_default#use(['matcher_fuzzy'])
nnoremap <leader>t :<C-u>Unite -no-split -buffer-name=files   -start-insert file_rec/async<cr>
nnoremap <leader>f :<C-u>Unite -no-split -buffer-name=files   -auto-preview   -start-insert file<cr>
nnoremap <leader>h :<C-u>Unite -no-split -buffer-name=mru     -start-insert file_mru<cr>
nnoremap <leader>o :<C-u>Unite -no-split -buffer-name=outline -start-insert outline<cr>
nnoremap <leader>y :<C-u>Unite -no-split -buffer-name=yank history/yank<cr>
nnoremap <leader>e :<C-u>Unite -no-split -buffer-name=files -start-insert buffer<cr>
nnoremap <leader>s :<C-u>Unite grep:.<cr>

"hack for removing unite buffers form jumplist (UniteResume) doesn't work because of that"
autocmd BufLeave \[unite\]* if "nofile" ==# &buftype | setlocal bufhidden=wipe | endif

" speed up recursive file searches
if executable('ag')
  let g:unite_source_rec_async_command= 'ag -l .'
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--smart-case --nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
elseif
    let g:unite_source_rec_async_command = 'ack -f --nofilter'
    let g:unite_source_grep_command = 'ack'
    let g:unite_source_grep_default_opts = '--no-color --no-heading'
    let g:unite_source_grep_recursive_opt = ''
endif

"}}}

"{{{ YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion=1
nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
"}}}

"{{{ airline
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1
"}}}

"{{{ tmux-navigator
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
"}}}

" jedi{{{
let g:jedi#auto_vim_configuration = 0   " disable vim auto configuration
let g:jedi#use_tabs_not_buffers = 0     " do go to in buffers
set completeopt=menuone,longest         " get rid of pydoc preview
set pumheight=15                        " set pop up menu to have fixed lenght
"}}}
