set nocompatible    "  enable vim features, depending on the terminal
"set showcmd         "  show the input commands

filetype on         " for syntax
syntax enable

" autoindenting, with 4 spaces
set autoindent
set expandtab
set smarttab
set shiftwidth=4
set softtabstop=4
" set backspace=4

set wildmenu        " show files completion on :e / :w

""" search
set ignorecase      " ignore case or search word
set smartcase       " except when search term uses a capital letter
set incsearch       " search while typing
set hlsearch        " highlight all searches

" avoid autoindenting
set pastetoggle=<F1>

" use tab (+shift) to un/indent in visual mode
vmap <Tab> >gv
vmap <S-Tab> <gv

" unindent in insert mode (Ctrl-t >>, Ctrl-d <<)
imap <S-Tab> <C-d>

" move cursor between splits
noremap <S-Up> <ESC><C-w><Up>
noremap <S-Down> <ESC><C-w><Down>
noremap <S-Left> <ESC><C-w><Left>
noremap <S-Right> <ESC><C-w><Right>

" set showmatch           " Show matching brackets.
" set mat=2		" How many tenth of a second to blink when matching brakets

""" mapping commands 
" syntax
nnoremap js :set syntax=javascript<CR>
nnoremap txt :set syntax=<CR>
nnoremap php :set syntax=php<CR>
nnoremap xml :set syntax=xml<CR>

set laststatus=2
"set statusline=\ %15.30F\ \ %y\ %=\ %l:%c/%L\ \ %p%%\ 
 set statusline=%#todo#  " switch to todo highlight
 set statusline+=\ %15.30F " show file
 set statusline+=\        " separator
 set statusline+=%*       " switch back to normal statusline highlight
 set statusline+=\ %y\ %=\ %l:%c/%L\ \ %p%%\ 

set cursorline 
set nu " line numbers
" {{{ colors
" cterm = {bold, underline, reverse, italic, none}
hi LineNr       ctermfg=white       cterm=bold
hi CursorLine   ctermbg=lightgray   cterm=none
hi Special      ctermfg=DarkYellow  cterm=none  
hi Constant     ctermfg=Cyan        cterm=none
hi String       ctermfg=DarkYellow        cterm=none
hi Character    ctermfg=Cyan        cterm=none
hi Number       ctermfg=Cyan        cterm=none
hi Boolean      ctermfg=Cyan        cterm=none
 
hi Comment     ctermfg=grey
hi pythonComment ctermfg=grey

" status line color
hi todo         ctermbg=LightGreen ctermfg=black
hi statusline   ctermfg=darkcyan   ctermbg=black
" }}}

" {{{ snippets
source .vim_snippets
" }}}
