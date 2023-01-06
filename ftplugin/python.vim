" preferred indentation
set tabstop=4
set softtabstop=4
set shiftwidth=4

" use autopep8 for formating selection formating (gq)
"set formatprg=autopep8\ -a\ -

" use black for formating selection formating (gq)
set formatprg=black\ -q\ 2>/dev/null\ --stdin-filename\ %\ -
