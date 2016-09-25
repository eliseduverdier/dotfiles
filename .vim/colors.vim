set bg=dark

  " vim colors

  " cterm = {bold, underline, reverse, italic, none}
  " for ctermbg and ctermfg list, see :h cterm-colors
  " for things to set up, see :so $VIMRUNTIME/syntax/hitest.vim


hi Special      ctermfg=DarkYellow  cterm=none
hi Constant     ctermfg=Green        cterm=none
hi String       ctermfg=Yellow      cterm=none
hi Character    ctermfg=Green        cterm=none
hi Number       ctermfg=Green        cterm=none
hi MatchParen   ctermbg=Yellow
hi Boolean      ctermfg=Green        cterm=none
hi Type         ctermfg=LightGreen

" comments
hi Comment       ctermfg=grey
hi pythonComment ctermfg=grey

" interface
hi LineNr       ctermfg=white       cterm=bold
hi CursorLine   cterm=underline

" status line color
hi User1        ctermfg=white   ctermbg=darkGreen    cterm=bold
hi StatusLine   ctermfg=white   ctermbg=Yellow   cterm=bold
hi StatusLineNC ctermfg=white   ctermbg=Black        cterm=none
