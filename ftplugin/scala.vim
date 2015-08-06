" disable syntastic for Scala
let g:syntastic_ignore_files = ['\m\c\.h$', '\m\.sbt$']
let g:syntastic_scala_checkers = ['']

" scala formatter
set formatprg=scalariform\ -f\ -q\ --stdin\ --stdout

" delimitMate
let b:delimitMate_expand_cr = 2
