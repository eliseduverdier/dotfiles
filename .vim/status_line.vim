" Statusline

""" status line:   [buffer nb] |    file path [modified] | [type]    ...  line:col/total   position
set laststatus=2
set statusline=
set statusline+=%1*                      " switch highlight
set statusline+=\ [%n]\ \ 
set statusline+=\ %30F\ \%m\            " show file
set statusline+=%*                       " switch back to normal statusline highlight
set statusline+=\ %y\ %=\ %l:%c/%L\ \ %P\    " line:col/total  position




