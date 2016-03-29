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

" change some colors
:highlight LineNr ctermfg=grey
:highlight Comment ctermfg=grey
:highlight Constant ctermfg=yellow
:highlight String ctermfg=yellow
:highlight Character ctermfg=yellow
:highlight Number ctermfg=yellow
:highlight Boolean ctermfg=yellow
:highlight pythonComment ctermfg=grey

" set showmatch           " Show matching brackets.
" set mat=2		" How many tenth of a second to blink when matching brakets

""" mapping commands 
" syntax
nnoremap js :set syntax=javascript<CR>
nnoremap txt :set syntax=<CR>
nnoremap php :set syntax=php<CR>
nnoremap xml :set syntax=xml<CR>

