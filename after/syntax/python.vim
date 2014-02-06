" highlight pydoc strings with same color as comment - dirty hack for solarized colorscheme
syn region Comment  start=+^\s*[uU]\?[rR]\?"""+ end=+"""+ keepend excludenl contains=pythonEscape,@Spell,pythonDoctest,pythonDocTest2,pythonSpaceError
syn region Comment  start=+^\s*[uU]\?[rR]\?'''+ end=+'''+ keepend excludenl contains=pythonEscape,@Spell,pythonDoctest,pythonDocTest2,pythonSpaceError

" highlight self and cls as keywords
syn keyword pythonExceptions self
syn keyword pythonExceptions cls
