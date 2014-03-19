" preferred indentation
set tabstop=4
set softtabstop=4
set shiftwidth=4

function! MyPep8Format()
    execute ':w'
    execute '!autopep8 --in-place --max-line-length 120 %'
    execute ':SyntasticCheck'
endfunction

" format according to pep8 and check syntax
nnoremap <silent> <F11> :call MyPep8Format()<CR>
