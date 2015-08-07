" syntastic
let g:syntastic_scala_scalastyle_jar="/usr/local/Cellar/scalastyle/0.7.0/libexec/scalastyle_2.11-0.7.0-batch.jar"
let g:syntastic_scala_scalastyle_config_file="~/.config/scala/scalastyle_config.xml"
let g:syntastic_scala_checkers=['scalastyle']

" scala formatter
set formatprg=scalariform\ -f\ -q\ --stdin\ --stdout

" delimitMate
let b:delimitMate_expand_cr = 2

" vim-scala
let g:scala_use_default_keymappings = 0

" remove trailing whitespaces on save
autocmd BufWritePre * :%s/\s\+$//e
