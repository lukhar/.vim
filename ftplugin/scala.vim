" syntastic
let g:syntastic_scala_checkers=['']

" scala formatter
set formatprg=scalariform\ -f\ -q\ --stdin\ --stdout

" delimitMate
let b:delimitMate_expand_cr = 2

" vim-scala
let g:scala_use_default_keymappings = 0

" remove trailing whitespaces on save
autocmd BufWritePre * :%s/\s\+$//e
