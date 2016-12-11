" use jellybeans color scheme
colorscheme jellybeans
let g:airline_theme='dark'

" scala formatter
set formatprg=scalariform\ -f\ -q\ --stdin\ --stdout

" delimitMate
let b:delimitMate_expand_cr = 2

" vim-scala
let g:scala_use_default_keymappings = 0

" remove trailing whitespaces on save
autocmd BufWritePre * :%s/\s\+$//e

" ensime mappings
noremap <buffer> <silent> gD :EnDeclaration<CR>
nnoremap <buffer> <silent> <leader>T :EnDocBrowse<CR>
nnoremap <leader>t :EnType<CR>
nnoremap <leader>d :EnDocBrowse<CR>
nnoremap <leader>i :EnInspectType<CR>
nnoremap <leader>I :EnInspectType<CR>
nnoremap <leader>l :EnFormatSource<CR>
