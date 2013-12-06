" Vim color file
" Maintainer:   Bohdan Vlasyuk <bohdan@vstu.edu.ua>
" Last Change:  2006 Apr 30

" darkblue -- for those who prefer dark background
" [note: looks bit uglier with come terminal palettes,
" but is fine on default linux console palette.]

set bg=dark
hi clear
if exists("syntax_on")
    syntax reset
endif

let colors_name = "lukash"


" Normal, Visual, Search
hi Normal          ctermfg=darkgreen   ctermbg=none        cterm=none
hi ErrorMsg        ctermfg=white       ctermbg=lightblue
hi Visual                              ctermbg=black
hi VisualNOSne     ctermfg=black                           cterm=reverse,underline
hi Todo            ctermfg=red         ctermbg=darkblue
hi Search          ctermfg=white       ctermbg=darkblue    cterm=underline
hi IncSearch       ctermfg=darkblue    ctermbg=gray

hi Normal          guifg=#00c800       guibg=#000800
hi ErrorMsg        guifg=#ffffff       guibg=#287eff
hi Visual                              guibg=black         gui=reverse
hi VisualNOS       guifg=#8080ff       guibg=fg            gui=reverse,underline
hi Todo            guifg=#d14a14       guibg=#1248d1
hi Search          guifg=#90fff0       guibg=#2050d0
hi IncSearch       guifg=#b0ffff       guibg=#2050d0


" Special, Directory, Title
hi SpecialKey      ctermfg=darkcyan
hi Directory       ctermfg=cyan
hi Title           ctermfg=magenta                         cterm=bold
hi WarningMsg      ctermfg=red
hi WildMenu        ctermfg=yellow      ctermbg=black       cterm=none
hi ModeMsg         ctermfg=lightblue
hi MoreMsg         ctermfg=darkgreen
hi Question        ctermfg=green                           cterm=none
hi NonText         ctermfg=darkblue

hi SpecialKey      guifg=cyan
hi Directory       guifg=cyan
hi Title           guifg=magenta                           gui=none
hi WarningMsg      guifg=red
hi WildMenu        guifg=yellow        guibg=black
hi ModeMsg         guifg=#22cce2
"hi MoreMsg         
hi Question        guifg=green                             gui=none
hi NonText         guifg=#0030ff


" StatusLine
hi StatusLine      ctermfg=white       ctermbg=darkgreen
hi StatusLineNC    ctermfg=black       ctermbg=darkgreen
hi VertSplit       ctermfg=black       ctermbg=darkgreen

hi StatusLine      guifg=white         guibg=darkgreen     gui=none
hi StatusLineNC    guifg=black         guibg=darkgreen     gui=none
hi VertSplit       guifg=black         guibg=darkgreen     gui=none

" Fold
hi Folded          ctermfg=darkgrey    ctermbg=black       cterm=bold
hi FoldColumn      ctermfg=darkgrey    ctermbg=black       cterm=bold
hi LineNr          ctermfg=green                           cterm=none

hi Folded          guifg=#808080       guibg=#000040
hi FoldColumn      guifg=#808080       guibg=#000040
hi LineNr          guifg=#90f020

" Cursor
hi Cursor          ctermfg=black       ctermbg=yellow      cterm=none
hi lCursor         ctermfg=black       ctermbg=yellow      cterm=none

hi Cursor          guifg=black         guibg=yellow
hi lCursor         guifg=black         guibg=white


" Diff
hi DiffAdd                             ctermbg=darkblue    cterm=none
hi DiffChange                          ctermbg=magenta     cterm=none
hi DiffDelete      ctermfg=blue        ctermbg=cyan
hi DiffText                            ctermbg=red         cterm=bold

hi DiffAdd                             guibg=darkblue
hi DiffChange                          guibg=darkmagenta
hi DiffDelete      guifg=blue          guibg=darkcyan      gui=bold
hi DiffText                            guibg=red           gui=bold



" Popup Menu
hi Pmenu           ctermfg=black       ctermbg=darkgreen
hi PmenuSel        ctermfg=black       ctermbg=yellow
hi PmenuSbar                           ctermbg=blue
hi PmenuThumb      ctermfg=cyan

hi Pmenu           guifg=black         guibg=darkgreen
hi PmenuSel        guifg=black         guibg=yellow
hi PmenuSbar                           guibg=blue
hi PmenuThumb      guifg=cyan


" Tabs
hi TabLine     ctermfg=black           ctermbg=blue        cterm=none
hi TabLineSel  ctermfg=black           ctermbg=cyan        cterm=underline
hi TabLineFill ctermfg=green           ctermbg=black


" Keywords
hi Comment         ctermfg=cyan                            cterm=bold
hi Constant        ctermfg=magenta                         cterm=none
hi Special         ctermfg=grey                            cterm=none
hi Identifier      ctermfg=lightcyan                       cterm=none
hi Statement       ctermfg=yellow                          cterm=bold
hi PreProc         ctermfg=blue                            cterm=none
hi Type            ctermfg=lightgreen                      cterm=bold
hi Underlined                                              cterm=underline
hi Ignore          ctermfg=black
hi MatchParen      ctermfg=white       ctermbg=red         cterm=bold

hi Comment         guifg=cyan                              gui=italic
hi Constant        guifg=#ff55ff
hi Special         guifg=#426775                          gui=none
hi Identifier      guifg=lightblue
hi Statement       guifg=#ffff60                           gui=none
hi PreProc         guifg=#5555ff                           gui=none
hi Type            guifg=#8fff8f                           gui=none
"hi Underlined      
hi Ignore          guifg=bg
hi MatchParen      guifg=white         guibg=red
