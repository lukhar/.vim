" preferred indentation
set tabstop=4
set softtabstop=4
set shiftwidth=4

" use autopep8 for formating selection formating (gq)
set formatprg=autopep8\ -a\ -

" use yapf to format whole file
autocmd FileType python nnoremap gy :0,$!yapf<Cr>
