" highlight pydoc strings with same color as comment - dirty hack for solarized colorscheme -> also make them foldable at the same time
syn region Comment  start=+^\s*[uU]\?[rR]\?"""+ end=+"""+ keepend excludenl contains=pythonEscape,@Spell,pythonDoctest,pythonDocTest2,pythonSpaceError fold
syn region Comment  start=+^\s*[uU]\?[rR]\?'''+ end=+'''+ keepend excludenl contains=pythonEscape,@Spell,pythonDoctest,pythonDocTest2,pythonSpaceError fold


" highlight self and cls as keywords
syn keyword pythonExceptions self
syn keyword pythonExceptions cls

" make sure that Comment regions are folded
setlocal foldmethod=syntax

" get rid of number of lines and filler chars
set fillchars=stl:^,stlnc:-,vert:\|,fold:\ ,diff:-

function! CustomFoldDoc()
    return '+'.getline(v:foldstart)
endfunction
set foldtext=CustomFoldDoc()

" get rid of underline highlight
highlight Folded gui=NONE
